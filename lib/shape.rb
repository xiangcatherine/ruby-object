# frozen_string_literal: true

require 'pry'

# Shape class
class Shape
  attr_reader :num_sides
  attr_accessor :side_length
  attr_accessor :color

  def initialize(num_sides, side_length)
    @num_sides = num_sides
    @side_length = side_length
  end

  def add_color(color)
    @color = color
  end

  def calculate_area
    @num_sides * @side_length * @side_length / (4 * Math.tan(Math::PI / @num_sides))
  end
end

square = Shape.new(4, 9)
puts square.add_color('blue')
puts square.calculate_area
