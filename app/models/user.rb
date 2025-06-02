class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'を入力してください' }
   validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'を入力してください' }
   validates :first_name_kana, format: { with: /\A[ァ-ヶ一]+\z/, message: 'を入力してください' }
   validates :last_name_kana, format: { with: /\A[ァ-ヶ一]+\z/, message: 'を入力してください' }


end
