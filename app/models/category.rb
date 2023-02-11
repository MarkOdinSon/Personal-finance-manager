class Category < ApplicationRecord
  has_many :operations

  validates :name, :description, presence: true # validates_presence_of :name, :description

  validates :name, uniqueness: true

  # Paginator [https://github.com/kaminari/kaminari]
  paginates_per 30 # default

  # search for movies on the home (root) page by title
  scope :search_by_category_name_scope, ->(name) { Category.where('LOWER(name) LIKE ?', "%#{name.gsub('+', ' ').downcase}%").order(:name) }
end
