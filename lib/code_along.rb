# frozen_string_literal: true

require 'pry'

# same as creating constructor function in JS
class Rectangle
  def initialize(length, width)
    @length = length
    @width = width
  end

  def area
    @length * @width
  end
end

first_rect = Rectangle.new(3, 5)
first_rect.area

second_rect = Rectangle.new(5, 16)
second_rect.area
