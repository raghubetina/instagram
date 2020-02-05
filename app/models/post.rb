class Post < ApplicationRecord
  # Direct associations

  belongs_to :user

  has_many   :likes,
             :dependent => :destroy

  # Indirect associations

  has_many   :fans,
             :through => :likes,
             :source => :user

  # Validations

  validates :image, :presence => true

end
