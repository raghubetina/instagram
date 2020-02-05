class Post < ApplicationRecord
  # Direct associations

  belongs_to :user

  has_many   :likes,
             :dependent => :destroy

  # Indirect associations

  # Validations

  validates :image, :presence => true

end
