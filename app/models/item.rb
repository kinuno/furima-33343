class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :condition, :fee, :prefecture, :delivery_days

  validates :name, :explanation, :price, :image, presence: true
  validates :category_id, :condition_id, :fee_id, :prefecture_id, :delivery_days_id,
            numericality: { other_than: 1, message: 'Select' }
  validates :price, numericality: { only_integer: true, message: 'Half-width number' }
  validates :price,
            numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }
end
