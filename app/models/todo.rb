class Todo < ApplicationRecord
  belongs_to :post
  validates :description, presence: true
end
