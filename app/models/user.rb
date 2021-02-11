class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
  validates :nickname
  validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'Full-width characters' }
  validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'Full-width characters' }
  validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'Full-width katakana characters' }
  validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'Full-width katakana characters' }
  validates :birthday
  end

  validates :password, format: { with: /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]{6,}\z/, message: 'Include both letters and numbers' }
end
