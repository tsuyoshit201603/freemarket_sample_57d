class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable
  validates :nickname, presence: true
  validates :first_name_kanji, presence: true
  validates :family_name_kanji, presence: true
  validates :first_name_cana, presence: true
  validates :family_name_cana, presence: true
  validates :year, presence: true
  validates :month, presence: true
  validates :day, presence: true

  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first
 
    unless user
      user = User.create(
        uid:      auth.uid,
        provider: auth.provider,
        email:    auth.info.email,
        password: Devise.friendly_token[0, 20]
      )
    end
 
    user
  end
end
