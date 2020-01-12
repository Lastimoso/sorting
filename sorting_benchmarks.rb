# frozen_string_literal: true

require 'benchmark'
require './bubble'
require './selection'

def sorted?(array)
  array.each_cons(2).all? { |a, b| (a <=> b) <= 0 }
end

examples = [100, 1000, 10_000, 30_000]

examples.each do |example|
  array = (1..example).to_a.shuffle.freeze

  puts "Example: Array Length = #{example}"
  Benchmark.bm(7) do |x|
    x.report('Bubble:   ') { @bubble = SelectionSort.new(array.dup).sort }
    x.report('Selection:') { @selection = SelectionSort.new(array.dup).sort }
    x.report('RubySort: ') { @selection = array.dup.sort }
  end

  puts '**Accuracy**'
  puts "BubbleSort = #{sorted? @bubble}"
  puts "SelectionSort = #{sorted? @selection}"
  puts ''
end
