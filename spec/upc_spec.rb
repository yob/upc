$LOAD_PATH << File.dirname(__FILE__) + "/../lib"

require 'upc'

RSpec.describe UPC do
  it "should identify a valid UPC" do
    expect(UPC.new("632737715836").valid?).to be true
  end

  it "should identify a valid UPC" do
    expect(UPC.valid?("632737715836")).to be true
    expect(UPC.valid?(632737715836)).to be true
  end

  it "should identify an invalid UPC" do
    expect(UPC.valid?(nil)).to be false
    expect(UPC.valid?("902865")).to be false
    expect(UPC.valid?(Array)).to be false
    expect(UPC.valid?(Array.new)).to be false
    expect(UPC.valid?("632737715837")).to be false
    expect(UPC.valid?("63273771583")).to be false
  end

  it "should calculate a UPC check digit correctly" do
    expect(UPC.complete("63273771583")).to eql("632737715836")
    expect(UPC.complete(63273771583)).to eql("632737715836")
    expect(UPC.complete("63273720503")).to eql("632737205030")
    expect(UPC.complete("63273712223")).to eql("632737122238")
  end

  it "should convert to an EAN correctly" do
    expect(UPC.new("632737715836").to_ean).to eql("0632737715836")
    expect(UPC.new(632737715836).to_ean).to eql("0632737715836")
  end
end
