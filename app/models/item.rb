class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :category, optional: true
  belongs_to :sales_status, optional: true
  belongs_to :shopping_fee_status, optional: true
  belongs_to :prefecture, optional: true
  belongs_to :scheduled_delivery, optional: true

  validates :category_id, numericality: { other_than: 1, message: 'Select' }
  validates :sales_status_id, numericality: { other_than: 0, message: 'Select' }
  validates :shopping_fee_status_id, numericality: { other_than: 0, message: 'Select' }
  validates :prefecture_id, numericality: { other_than: 0, message: 'Select' }
  validates :scheduled_delivery_id, numericality: { other_than: 0, message: 'Select' }

  with_options presence: true do
    validates :image
    validates :name
    validates :info
    validates :price, format: { with: /\A[0-9]+\z/, message: 'Half-width number' },
                      numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }
  end
end
