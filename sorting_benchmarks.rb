# frozen_string_literal: true

require 'benchmark'
require './bubble'
require './selection'
require './insertion'

def sorted?(array)
  array.each_cons(2).all? { |a, b| (a <=> b) <= 0 }
end

def array_is_ok?(array)
  array.each_with_index do |value, index|
    return false unless value == index + 1

  end
  true
end

examples = [100, 1_000, 10_000, 30_000]

examples.each do |example|
  array = (1..example).to_a.shuffle.freeze

  puts "Example: Array Length = #{example}"
  Benchmark.bm(7) do |x|
    x.report('Bubble:   ') { @bubble = SelectionSort.new(array.dup).sort }
    x.report('Selection:') { @selection = SelectionSort.new(array.dup).sort }
    x.report('Insertion:') { @insertion = InsertionSort.new(array.dup).sort }
    x.report('RubySort: ') { array.dup.sort }
  end

  puts ''
  puts "ALERT!! BubbleSort is NOT sorted" unless sorted? @bubble
  puts "ALERT!! SelectionSort is NOT sorted" unless sorted? @selection
  puts "ALERT!! InsertionSort is NOT sorted" unless sorted? @insertion
  puts "ALERT!! BubbleSort array has been modified" unless array_is_ok? @bubble
  puts "ALERT!! SelectionSort arrys has been modified" unless array_is_ok? @selection
  puts "ALERT!! InsertionSort arrys has been modified" unless array_is_ok? @insertion
  puts ''
end
