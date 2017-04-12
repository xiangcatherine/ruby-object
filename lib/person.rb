# frozen_string_literal: true

require 'pry'

# Person class
class Person
  def initialize(given_name, surname, favorite_food, catchphrase)
    @given_name = given_name
    @surname = surname
    @favorite_food = favorite_food
    @catchphrase = catchphrase
  end

  def given_name
    @given_name
  end

  def given_name=(given_name)
    @given_name = given_name
  end

  def surname
    @surname
  end

  def surname=(surname)
    @surname = surname
  end

  def favorite_food
    @favorite_food
  end

  def favorite_food=(favorite_food)
    @favorite_food = favorite_food
  end

  def catchphrase
    @catchphrase
  end

  def catchphrase=(catchphrase)
    @catchphrase = catchphrase
  end
end
