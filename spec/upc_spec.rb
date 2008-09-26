$LOAD_PATH << File.dirname(__FILE__) + "/../lib"

require 'spec'
require 'upc'

describe "The UPC class" do
  it "should identify a valid UPC" do
    UPC.new("632737715836").valid?.should be_true
  end

  it "should identify a valid UPC" do
    UPC.valid?("632737715836").should be_true
    UPC.valid?(632737715836).should   be_true
  end
  
  it "should identify an invalid UPC" do
    UPC.valid?(nil).should       be_false
    UPC.valid?("902865").should  be_false
    UPC.valid?(Array).should     be_false
    UPC.valid?(Array.new).should be_false
    UPC.valid?("632737715837").should  be_false
    UPC.valid?("63273771583").should   be_false
  end

  it "should calculate a UPC check digit correctly" do
    UPC.complete("63273771583").should eql("632737715836")
    UPC.complete(63273771583).should   eql("632737715836")
    UPC.complete("63273720503").should eql("632737205030")
    UPC.complete("63273712223").should eql("632737122238")
  end

  it "should convert to an EAN correctly" do
    UPC.new("632737715836").to_ean.should eql("0632737715836")
    UPC.new(632737715836).to_ean.should   eql("0632737715836")
  end
end
