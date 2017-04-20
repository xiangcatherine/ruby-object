# frozen_string_literal: true

# OK fine here's a comment
class Shape
  attr_reader :num_sides
  attr_accessor :side_length
  attr_accessor :color

  def initialize(num_sides, side_length)
    @num_sides = num_sides
    @side_length = side_length
    @color
  end

  def calculate_area
    (@num_sides * @side_length * @side_length) / (4 * Math.tan(Math::PI / @num_sides))
  end

  def string
    puts "Here's a #{@color} shape with #{@num_sides} sides that are #{@side_length} units long."
  end
end

shape_one = Shape.new(5, 10)
shape_one.color = 'magenta'
shape_one.string
shape_one.calculate_area
puts shape_one.calculate_area

shape_two = Shape.new(7, 25)
shape_two.color = 'crimson'
shape_two.string
shape_two.calculate_area
puts shape_two.calculate_area

require 'pry'
