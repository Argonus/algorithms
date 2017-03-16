module Course1
  module Week3
    class QuickSort
      def initialize(array)
        @array = array
      end

      def sort!
        return @array if @array.empty?
      end
    end
  end
end
