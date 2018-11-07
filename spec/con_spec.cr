require "spec"
require "../src/con"

describe CON::Any do
  con = CON.parse <<-DATA
  key {
    b "val"
  }
  e [
    {
      o "p"
    }
    12
    2
  ]
  DATA

  it "gets a non existent key" do
    con[["key", "r"]]?.should eq nil
  end

  it "set a key" do
    con_tmp = con.dup
    (con_tmp[["e", 0, "o"]] = CON::Any.new "test").should eq "test"
    con_tmp.should eq({"key" => {"b" => "val"}, "e" => [{"o" => "test"}, 12_i64, 2_i64]})
  end

  it "deletes a key" do
    con_tmp = con.dup
    con_tmp.delete(["e", 0, "o"])
    con_tmp.should eq({"key" => {"b" => "val"}, "e" => [Hash(String, String).new, 12_i64, 2_i64]})
  end
end
