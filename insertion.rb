# frozen_string_literal: true

class InsertionSort
  attr_reader :array

  def initialize(array)
    @array = array
  end

  def sort
    array.size.times do |index|
      current_index = index
      current_value = array[current_index]
      while current_index.positive? && current_value < array[current_index - 1] do
        array[current_index] = array[current_index - 1]
        current_index -= 1
      end
      array[current_index] = current_value
    end
    array
  end
end