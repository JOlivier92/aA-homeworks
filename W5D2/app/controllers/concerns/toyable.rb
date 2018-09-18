module Toyable
  extend ActiveSupport::Concern

  included do
    has_many :references, as :reference
    has_many :toys, through: :references

  end

  def receive_toy(name)
    self.joins(:toys).where('toys.name' => name)
  end
end
