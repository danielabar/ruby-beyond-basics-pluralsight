# frozen_string_literal: true

require './data'

# Illustrate meta programming with Ruby
class Dinosaur
  def self.add_attribute(name, value)
    define_method(name) do
      value
    end
  end

  def self.match_on(attr_name)
    method_name = "match_#{attr_name}"
    define_method(method_name) do |value|
      # retrieve an attribute, and compare to value passed in
      # i.e. "call this method whose name matches a value stored in this variable"
      # eg: if attr_name is diet, invoke the `diet` method,
      # which got defined dynamically by self.add_attribute above
      attr = send(attr_name)
      attr == value
    end
  end

  def initialize(data)
    data.each do |key, value|
      self.class.add_attribute(key, value)
    end
  end
end

# A particular species of Dinosaur
class Diplodocus < Dinosaur
  match_on :diet
  match_on :suborder
end
