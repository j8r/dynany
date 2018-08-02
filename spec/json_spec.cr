require "spec"
require "../src/json"

describe JSON::Any do
  json = JSON.parse <<-DATA
  {"key":
    {
      "b":"val"
    },
   "e": [
     {
       "o": "p"
     },
     12,
     2]
    }
  DATA

  it "gets a non existent key" do
    json[["key", "r"]]?.should be_nil
  end

  it "set a key" do
    json_tmp = json.dup
    (json_tmp[["e", 0, "o"]] = JSON::Any.new "test").should eq "test"
    json_tmp.should eq({"key" => {"b" => "val"}, "e" => [{"o" => "test"}, 12_i64, 2_i64]})
  end

  it "deletes a key" do
    json_tmp = json.dup
    json_tmp.delete(["e", 0, "o"])
    json_tmp.should eq({"key" => {"b" => "val"}, "e" => [Hash(String, String).new, 12_i64, 2_i64]})
  end
end
