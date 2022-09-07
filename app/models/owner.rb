class Owner < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :pref

  has_many :items

  validates :nickname, presence: true
  validates :appeal, presence: true
  validates :corporation, presence: true
  validates :tell, format: {with: /\A\d{10,11}\z/}
  validates :pref_id, numericality: {other_than: 1}
  

end
