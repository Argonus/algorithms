module Course1
  module Week2
    class CountInversions
      attr_reader :number_of_inversions, :sorted_array

      def initialize(array)
        @given_array = array
      end

      def count
        if @given_array.size <= 1
          @sorted_array, @number_of_inversions = @given_array, 0
          return @number_of_inversions
        end

        @sorted_array, @number_of_inversions = sort_and_count(@given_array)
        @number_of_inversions
      end

      private

      def sort_and_count(array)
        return [array, 0] if array.size.eql?(1)
      end
    end
  end
end
