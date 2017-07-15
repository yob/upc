class UPC

  class Version #:nodoc:
    MAJOR = 1
    MINOR = 0
    TINY  = 0

    String = [MAJOR, MINOR, TINY].join('.')
  end

  def initialize(str)
    @number = str.to_s
  end

  def valid?
    UPC.valid? @number
  end

  def self.valid?(upc)
    upc = upc.to_s
    upc.length == 12 && upc == UPC.complete(upc[0, 11])
  end

  # Purely for generating new UPC numbers
  def self.complete(eleven)
    eleven = eleven.to_s
    return nil unless eleven.length == 11 && eleven.match(/\d{11}/)

    arr = (0..10).to_a.collect do |i|
      if (i+1).odd?
        eleven[i,1].to_i * 3
      else
        eleven[i,1].to_i
      end
    end
    sum = arr.inject { |sum, n| sum + n }
    remainder = sum % 10
    (remainder == 0) ? check = 0 : check = 10 - remainder

    eleven + check.to_s
  end

  def to_ean
    return nil unless valid?
    "0#{@number}"
  end
end
