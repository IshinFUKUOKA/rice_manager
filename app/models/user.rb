class User < ActiveRecord::Base
  has_many :bookings
  has_many :rice, foreign_key: :buyer_id
end
