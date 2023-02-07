class Category < ApplicationRecord
  has_many :operations

  validates :name, :description, presence: true # validates_presence_of :name, :description

  validates :name, uniqueness: true
end
