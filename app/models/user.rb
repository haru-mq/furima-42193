class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   validates :first_name, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'を入力してください' }
   validates :last_name, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'を入力してください' }


end
