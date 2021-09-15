class User < ApplicationRecord
    validates :username, uniqueness: true
    has_many :events, foreign_key: :hosted_by, dependent: :destroy
    has_many :tickets, dependent: :destroy
end
