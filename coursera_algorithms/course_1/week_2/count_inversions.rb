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

        left_half, right_half = split(array)

        left_result = sort_and_count(left_half)
        right_result = sort_and_count(right_half)
        merged_result = merge_and_count(left_result.first, right_result.first)

        return merged_result.first, compute_results(left_result, merged_result, right_result)
      end

      def split(array)
        array.each_slice((array.size/2.0).round).to_a
      end

      def merge_and_count(left_array, right_array)
        merged_array, inversions, i, j = [], 0, 0, 0

        (left_array.size + right_array.size).times do
          left_value, right_value = left_array[i], right_array[j]
          if right_empty?(left_value, right_value) || left_smaller?(left_value, right_value)
            i = merge(i, left_value, merged_array)
          else
            j = merge(j, right_value, merged_array)
            inversions += (left_array.size - i)
          end
        end

        return merged_array, inversions
      end

      def right_empty?(left_value, right_value)
        !left_value.nil? && right_value.nil?
      end

      def left_smaller?(left_value, right_value)
        !left_value.nil? && !right_value.nil? && left_value <= right_value
      end

      def merge(n, left_value, merged_array)
        merged_array << left_value
        n + 1
      end

      def compute_results(left_result, merge_result, right_result)
        left_result[1] + right_result[1] + merge_result[1]
      end
    end
  end
end
