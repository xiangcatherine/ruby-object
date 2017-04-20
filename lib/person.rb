# frozen_string_literal: true

require 'pry'

# creating Person class
class Person
  def initialize(given_name, surname, nickname, favorite_food, catchphrase)
    @given_name = given_name
    @surname = surname
    @nickname = nickname
    @favorite_food = favorite_food
    @catchphrase = catchphrase
  end

  def favorite_food
    @favorite_food
  end

  def favorite_food=(favfood)
    @favorite_food = favfood
  end

  def nickname
    @nickname
  end

  def nickname=(shortname)
    @nickname = shortname
  end

  def introduce
    puts "My name is #{@given_name} #{@surname}, although people call me #{@nickname}. I love #{@favorite_food}."
  end
end

first_person = Person.new('Catherine', 'Xiang', 'Katty', 'noodles', 'Woohoo!')

first_person.favorite_food = 'donuts'
puts first_person.favorite_food

first_person.nickname = 'Katie'
puts first_person.nickname

first_person.introduce
