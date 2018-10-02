class Category < ApplicationRecord
  has_many :products
  validates :name, uniqueness: true
  scope :parent_category, -> {where parent_id: nil}
  scope :children_category, -> id {where parent_id: id}
  scope :sort_alphabet_az, ->{order "name"}
  scope :select_col, ->{attribute_names}
end
