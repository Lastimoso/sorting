# frozen_string_literal: true

require 'benchmark'

class BubbleSort
  attr_reader :array, :max_iterations

  def initialize(array)
    @array = array
    @max_iterations = array.length - 1
  end

  def sort
    max_iterations.times do |index|
      @swapped = false
      sort_remaining(index)
      break unless @swapped
    end
    array
  end

  private

  def sort_remaining(iteration_index)
    (max_iterations - iteration_index).times do |index|
      sort_pair(index)
    end
  end

  def sort_pair(index)
    next_index = index + 1
    return unless array[next_index] < array[index]

    array[index], array[next_index] = array[next_index], array[index]
    @swapped = true
  end
end
