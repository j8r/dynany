require "spec"
require "../src/yaml"

describe YAML::Any do
  yaml = YAML.parse <<-DATA
   a:
     b:
       key: val
     array:
      - test
      - another
  DATA

  it "gets a key" do
    yaml[["a", "b"]].should eq({"key" => "val"})
  end

  it "set a key" do
    yaml_tmp = yaml.dup
    (yaml[["a", "b", "PLOP"]] = YAML::Any.new "e").should eq "e"
    yaml_tmp[["a", "b"]].should eq({"key" => "val", "PLOP" => "e"})
  end

  it "deletes a key" do
    yaml_tmp = yaml.dup
    yaml_tmp.delete(["a", "array", 1])
    yaml_tmp.should eq({"a" => {"b" => {"key" => "val", "PLOP" => "e"}, "array" => ["test"]}})
  end
end
