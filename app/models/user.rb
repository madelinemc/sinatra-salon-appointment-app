class User < ActiveRecord::Base
    has_many :appointments
    has_many :services, through: :appointments
end