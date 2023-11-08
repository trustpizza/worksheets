class Sheet < ApplicationRecord
    has_many :columns, dependent: :destroy

    # Validations
    validates :title, presence: true
end
