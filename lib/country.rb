# frozen_string_literal: true

# Country class initialized with a single variable, name
class Country
  def initialize(name)
    @name = name
    @language
  end

  def name
    @name
  end

  def language         # 'getter' for @language
    @language
  end

  def language=(lang)  # 'setter' for @language
    @language = lang
  end
end

england = Country.new('England')
england.language = 'english' # invoking the 'setter'
puts england.language # invoking the 'getter' => "english"
puts england.name
