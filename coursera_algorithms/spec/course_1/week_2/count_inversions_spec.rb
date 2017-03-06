require_relative '../../spec_helper'
require_relative '../../../course_1/week_2/count_inversions'

RSpec.describe Course1::Week2::CountInversions do
  [
    { array: [], count: 0 },
    { array: [1], count: 0 },
    { array: [2, 1], count: 1},
    { array: [1, 3, 2], count: 1},
    { array: [1, 3, 2, 5], count: 1 },
    { array: [1, 3, 5, 2, 4], count: 3},
    { array: [1, 3, 5, 2, 4, 6], count: 3 },
    { array: [1, 3, 5, 6, 7, 8, 2, 4, 9, 10, 12, 11], count: 10 }
  ].each do |hash_value|
    it "returns #{hash_value[:count]} for #{hash_value[:array]} as number of inversions" do
      object = described_class.new(hash_value[:array])
      expect(object.count).to eq hash_value[:count]
    end

    it "returns sorted array" do
      object = described_class.new(hash_value[:array])
      object.count
      expect(object.sorted_array).to eq hash_value[:array].sort
    end
  end
end
