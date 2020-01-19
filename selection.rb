# frozen_string_literal: true

class SelectionSort
  attr_reader :array, :max_iterations

  def initialize(array)
    @array = array
    @max_iterations = array.length - 1
  end

  def sort
    max_iterations.times do |index|
      smallest = nil
      smallest_index = nil
      (index..max_iterations).each do |inner_index|
        next if smallest && smallest < array[inner_index]

        smallest = array[inner_index]
        smallest_index = inner_index
      end
      array[index], array[smallest_index] = array[smallest_index], array[index]
    end
    array
  end
end
