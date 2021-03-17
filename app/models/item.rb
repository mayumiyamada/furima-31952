class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :order, dependent: :destroy

  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :category
  belongs_to :sales_status
  belongs_to :shopping_fee_status
  belongs_to :prefecture
  belongs_to :scheduled_delivery

  with_options presence: true do
    validates :image
    validates :name
    validates :info
    validates :price, format: { with: /\A[0-9]+\z/, message: 'Half-width number' },
                      numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }
  end

  with_options presence: true, numericality: { other_than: 0, message: 'Select' } do
    validates :sales_status_id
    validates :shopping_fee_status_id
    validates :prefecture_id
    validates :scheduled_delivery_id
  end

  validates :category_id, presence: true, numericality: { other_than: 1, message: 'Select' }
end
