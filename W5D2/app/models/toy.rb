class Toy < ApplicationRecord
  belongs_to :references, polymorphic: true
end
