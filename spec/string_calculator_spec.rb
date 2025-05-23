require_relative '../string_calculator'

RSpec.describe StringCalculator do
  it "returns 0 for an empty string" do
    calc = StringCalculator.new
    expect(calc.add("")).to eq(0)
  end
  
  it "returns the number itself for a single number" do
    calc = StringCalculator.new
    expect(calc.add("4")).to eq(4)
  end

  it "returns sum for two numbers separated by comma" do
    calc = StringCalculator.new
    expect(calc.add("1,2")).to eq(3)
  end

  it "returns sum for multiple comma-separated numbers" do
    calc = StringCalculator.new
    expect(calc.add("1,2,3,4")).to eq(10)
  end

  it "returns sum for numbers with new lines and commas" do
    calc = StringCalculator.new
    expect(calc.add("1\n2,3")).to eq(6)
  end

  it "supports custom delimiter defined with // delimiter syntax" do
    calc = StringCalculator.new
    expect(calc.add("//;\n1;2")).to eq(3)
  end

  it "raises exception for a single negative number" do
    calc = StringCalculator.new
    expect { calc.add("1,-2,3") }.to raise_error("negative numbers not allowed: -2")
  end

  it "raises exception listing all negative numbers" do
    calc = StringCalculator.new
    expect { calc.add("//;\n1;-2;-4") }.to raise_error("negative numbers not allowed: -2, -4")
  end

end
