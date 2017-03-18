require_relative '../../spec_helper'
require_relative '../../../course_1/week_3/quick_sort'

RSpec.describe Course1::Week3::QuickSort do

  it "returns empty array when empty array is given" do
    expect(described_class.new([]).sort!).to be_empty
  end

  shared_examples 'is sorting array of uniq elements' do
    (1..100).to_a.map do |range|
      (1..range).to_a.shuffle
    end.each do |array|
      it "for #{array}" do
        expect(described_class.new(array, manner).sort!).to eq array.sort
      end
    end
  end

  shared_examples 'is sorting array of random element' do
    (1..100).to_a.map do |range|
      (1..range).to_a.map { |el| rand(el) }.shuffle
    end.each do |array|
      it "for #{array}" do
        expect(described_class.new(array, manner).sort!).to eq array.sort
      end
    end
  end

  context 'select pivot as first element' do
    let(:manner) { :first }

    it_behaves_like 'is sorting array of uniq elements'
    it_behaves_like 'is sorting array of random element'
  end

  context 'select pivot as last element' do
    let(:manner) { :last }

    it_behaves_like 'is sorting array of uniq elements'
    it_behaves_like 'is sorting array of random element'
  end

  context 'select pivot as medium element' do
    let(:manner) { :middle }

    it_behaves_like 'is sorting array of uniq elements'
  end

  context 'select pivot as random element' do
    let(:manner) { :random }

    it_behaves_like 'is sorting array of uniq elements'
    it_behaves_like 'is sorting array of random element'
  end

  it "is not creating another array" do
    array = [1, 2, 3]
    expect(described_class.new(array).sort!).to equal array
  end

  it "it raises error when wrong manner is given" do
    array = [1, 2, 3]
    expect { described_class.new(array, :wrong_manner).sort! }.to raise_error(NotImplementedError)
  end
end
