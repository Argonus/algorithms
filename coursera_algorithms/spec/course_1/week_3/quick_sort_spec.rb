require_relative '../../spec_helper'
require_relative '../../../course_1/week_3/quick_sort'

RSpec.describe Course1::Week3::QuickSort do

  it "returns empty array when empty array is given" do
    expect(described_class.new([]).sort!).to be_empty
  end

  (0..100).to_a.map do |range|
    (0..range).to_a.shuffle
  end.each do |array|
    it "for #{array} it sorts its properly" do
      expect(described_class.new(array).sort!).to eq array.sort
    end
  end

  it "is not creating another array" do
    array = [1, 2, 3]
    expect(described_class.new(array).sort!).to equal array
  end
end
