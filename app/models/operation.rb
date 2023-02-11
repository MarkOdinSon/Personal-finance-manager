class Operation < ApplicationRecord
  belongs_to :category

  validates :amount, :odate, :description, presence: true # validates_presence_of :amount, :odate, :description

  validates :amount, numericality: { greater_than: 0 }

  # Paginator [https://github.com/kaminari/kaminari]
  paginates_per 30 # default

  # search for operations for category name
  scope :search_by_category_name_scope, ->(name) { Operation.where(category_id: Category.where('LOWER(name) LIKE ?', "%#{name.gsub('+', ' ').downcase}%").ids) }
end
