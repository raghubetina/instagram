class Like < ApplicationRecord
  # Direct associations

  belongs_to :user

  belongs_to :post

  # Indirect associations

  # Validations

end
