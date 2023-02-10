class Category < ApplicationRecord
  has_many :operations

  validates :name, :description, presence: true # validates_presence_of :name, :description

  validates :name, uniqueness: true

  # Paginator [https://github.com/kaminari/kaminari]
  paginates_per 30 # default
end
