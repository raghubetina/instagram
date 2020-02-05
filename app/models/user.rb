class User < ApplicationRecord
  # Direct associations

  has_many   :received_followings,
             :class_name => "Following",
             :foreign_key => "recipient_id",
             :dependent => :destroy

  has_many   :sent_followings,
             :class_name => "Following",
             :foreign_key => "sender_id",
             :dependent => :destroy

  has_many   :likes,
             :dependent => :destroy

  has_many   :posts,
             :dependent => :destroy

  # Indirect associations

  has_many   :leaders,
             :through => :sent_followings,
             :source => :recipient

  has_many   :followers,
             :through => :received_followings,
             :source => :sender

  # Validations

  validates :username, :uniqueness => true

  validates :username, :presence => true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
