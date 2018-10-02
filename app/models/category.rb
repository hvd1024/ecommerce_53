class Category < ApplicationRecord
  has_many :products
  scope :parent_category, -> {where parent_id: nil}
  scope :children_category, -> id {where parent_id: id}
end
