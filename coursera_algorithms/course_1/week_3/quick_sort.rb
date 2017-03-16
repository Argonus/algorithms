module Course1
  module Week3
    class QuickSort
      def initialize(array)
        @array = array
        @a_length = array.size
      end

      def sort!
        return @array if @a_length <= 1

        quicksort(@array, 0, @a_length)
      end

      private

      def quicksort(array, left, right)
        return array if left >= right

        current = partition(array,left,right)
        quicksort(array, left, current)
        quicksort(array, current+1, right)
        array
      end

      def partition(array, left, right)
        pivot, i = array[left], left+1

        (i...right).each do |j|
          i = swap_and_increment(array, i, j) if array[j] < pivot
        end

        swap_arrays(array, i-1, left)
        i-1
      end

      def swap_and_increment(array, i, j)
        swap_arrays(array, i, j)
        i + 1
      end

      def swap_arrays(array, i, j)
        array[j], array[i] = array[i], array[j]
      end
    end
  end
end
