class Product < ApplicationRecord
  validates :name, :reference, :price, :quantity, :brand, presence: true
  validates :price, numericality: true
  validates :quantity, numericality: { only_integer: true }
  validates :price, :quantity, numericality: { greater_or_equal_to: 0 }
end
