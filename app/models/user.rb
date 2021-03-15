class User < ApplicationRecord
  has_secure_password
  has_many :recipes, dependent: :destroy

  validates_presence_of :name
  validates_presence_of :age
  validates_presence_of :favourite_mums_dish
  validates :username, uniqueness: { case_sensitive: true }
  # validates :password, confirmation: true, unless: -> { password.blank? }

  # def validate_name(name)
  #   name.split("").all.match?(/[A-Za-z]/)
  # end

end
