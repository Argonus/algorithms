module Course1
  module Week3
    class QuickSort
      attr_reader :comparasions

      def initialize(array, manner = :random)
        @array = array
        @a_length = array.size
        @comparasions = 0
        @manner = manner
      end

      def sort!
        return @array if @a_length <= 1

        quicksort(@array, 0, @a_length)
      end

      private

      def quicksort(array, left, right)
        return array if left >= right

        current = partition(array, left, right)
        quicksort(array, left, current)
        quicksort(array, current+1, right)
        array
      end

      def partition(array, left, right)
        pivot, i = select_pivot_and_i(array, left, right)
        increment_number_of_comparisons(left, right)

        (i...right).each do |j|
          i = swap_and_increment(array, i, j) if array[j] < pivot
        end

        swap_arrays(array, i-1, left)
        i-1
      end

      def increment_number_of_comparisons(left, right)
        @comparasions += right-left-1
      end

      def swap_and_increment(array, i, j)
        swap_arrays(array, i, j)
        i + 1
      end

      def swap_arrays(array, i, j)
        array[j], array[i] = array[i], array[j]
      end

      def select_pivot_and_i(array, left, right)
        case @manner
          when :first
            pivot, i = array[left], calculate_i(left)
            return pivot, i
          when :last
            right_index = right-1
            pivot, i = array[right_index], calculate_i(left)

            swap_arrays(array, right_index, left)
            return pivot, i
          when :middle
            left_elemnt, right_element, length = array[left], array[right-1], (right-left)
            middle = select_middel_element(array, left, length)
            pivot, i = median(left_elemnt, right_element, middle), calculate_i(left)
            pivot_index = array.index(pivot)

            swap_arrays(array, pivot_index, left)
            return pivot, i
          when :random
            pivot_index = rand(left...right)
            pivot, i = array[pivot_index], calculate_i(left)

            swap_arrays(array, pivot_index, left)
            return pivot, i
          else
            raise NotImplementedError
        end
      end

      def calculate_i(left)
        left+1
      end

      def select_middel_element(array, left, length)
        length % 2 == 0 ? middle = array[left + length/2 - 1] : middle = array[left + length/2]
        middle
      end

      def median(a, b, c)
        [a, b, c].sort[1]
      end
    end
  end
end
