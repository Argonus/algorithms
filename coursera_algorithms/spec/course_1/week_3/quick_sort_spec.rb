require_relative '../../spec_helper'
require_relative '../../../course_1/week_3/quick_sort'

RSpec.describe Course1::Week3::QuickSort do
  [
    []
  ].each do |array|
    it 'sorts given array' do
      expect(described_class.new(array).sort!).to eq array.sort
    end
  end
end
