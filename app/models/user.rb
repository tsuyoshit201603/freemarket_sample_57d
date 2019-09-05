class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable,omniauth_providers: [:facebook, :google_oauth2]
  validates :nickname, presence: true
  validates :first_name_kanji, presence: true
  validates :family_name_kanji, presence: true
  validates :first_name_cana, presence: true
  validates :family_name_cana, presence: true
  validates :year, presence: true
  validates :month, presence: true
  validates :day, presence: true

  has_one :sns_credential, dependent: :destroy
  has_many   :users_products, dependent: :destroy
  has_many   :products, through: :users_products, dependent: :destroy
  belongs_to :address

  def self.find_oauth(auth)
    uid = auth.uid
    provider = auth.provider
    snscredential = SnsCredential.where(uid: uid, provider: provider).first

    if snscredential.present?
      user = User.where(id: snscredential.user_id).first
      unless user.present?
        user = User.new(
          nickname: auth.info.name,
          email: auth.info.email
        )
      end
      sns = snscredential

    else
      user = User.where(email: auth.info.email).first
      if user.present?
        sns = SnsCredential.new(
          uid: uid,
          provider: provider,
          user_id: user.id
        )
      else
        user = User.new(
          nickname: auth.info.name,
          email: auth.info.email
        )
        sns = SnsCredential.create(
          uid: uid,
          provider: provider
        )
      end
    end
    return { user: user , sns_id: sns.id }
  end
end
