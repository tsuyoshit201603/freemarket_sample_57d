class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  validates :first_name_kanji, presence: true
  validates :family_name_kanji, presence: true
  validates :first_name_cana, presence: true
  validates :family_name_cana, presence: true
  validates :year, presence: true
  validates :month, presence: true
  validates :day, presence: true
end
