class User < ApplicationRecord
  has_many :recipes
  has_many :preps
  has_many :saved_recipes
  has_many :liked_recipes, through: :saved_recipes, source: :recipe
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
