class Fridge < ActiveRecord::Base
  belongs_to :user
  has_many :foods, dependent: :destroy
  has_many :drinks, dependent: :destroy
  validates :location, :brand, :size, :presence => true
  validates :location, uniqueness: true

end
