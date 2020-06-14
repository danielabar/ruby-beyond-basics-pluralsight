# frozen_string_literal: true

require './data'

# Illustrate meta programming with dynamically created dinosaurs
class Dinosaur
  # name: name of attribute
  # value: value to be returned when attribute is read
  def self.add_attribute(name, value)
    define_method(name) do
      value
    end
  end

  # read in each json attribute, creating an attribute for it
  def initialize(data)
    data.each do |key, value|
      self.class.add_attribute(key, value)
    end
  end
end
