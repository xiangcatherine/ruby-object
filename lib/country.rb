# frozen_string_literal: true

# Country class initialized with a single variable, name
class Country
  attr_reader :name
  # attr_reader :language
  # attr_writer :language
  attr_accessor :language

  def initialize(name)
    @name = name
    @language
  end
end

england = Country.new('England')
england.language = 'english' # invoking the 'setter'
puts england.language # invoking the 'getter' => "english"
puts england.name
