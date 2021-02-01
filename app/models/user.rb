class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, uniqueness: true
  validates :nickname, presence: true     
  validates :last_name, presence: true, format:{with: /\A[ぁ-んァ-ン一-龥]/}          
  validates :first_name, presence: true, format:{with: /\A[ぁ-んァ-ン一-龥]/}    
  validates :last_name_kana, presence: true, format:{with: /\A[ァ-ヶー－]+\z/}       
  validates :first_name_kana, presence: true, format:{with: /\A[ァ-ヶー－]+\z/}    
  validates :birthday, presence: true

  validates :encrypted_password,:password,:password_confirmation,format:{with:  /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/}
  validates :password, confirmation: true

end