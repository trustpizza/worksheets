class Column < ApplicationRecord
  belongs_to :sheet

  validates :title, presence: true
end
