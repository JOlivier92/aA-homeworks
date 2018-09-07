#!/usr/bin/env ruby
class Dog

  def self.all
    @@dogs ||= []
  end

  def initialize(name)
    @name = name

    self.class.all << self
  end

  # could also use `attr_reader :name` to generate this.
  def name
    @name
  end
end
