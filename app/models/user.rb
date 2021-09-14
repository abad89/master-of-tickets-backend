class User < ApplicationRecord
    has_many :events, foreign_key: :hosted_by
    has_many :tickets
end
