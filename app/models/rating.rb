class Rating < ApplicationRecord
  scope :product_rating, ->(id){where(product_id: id)}
end
