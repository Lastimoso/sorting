# frozen_string_literal: true

class MergeSort
  attr_reader :array

  def initialize(array)
    @array = array
  end

  def sort
    inner_sort(array)
  end

  private

  def inner_sort(passed_array)
    return passed_array if passed_array.size <= 1

    left, right = passed_array.each_slice((passed_array.size / 2.0).ceil).to_a

    sorted_left = inner_sort(left)
    sorted_right = inner_sort(right)

    merge_halfs(sorted_left, sorted_right)
  end

  def merge_halfs(left, right)
    sorted_array = []

    while(left.size.positive? && right.size.positive?)
      sorted_array << if left[0] <= right[0]
        left.shift
      else
        right.shift
      end
    end


    sorted_array + (left.size.positive? ? left : right)
  end
end
