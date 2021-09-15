class Event < ApplicationRecord
    validates :name, presence: true
    validates :date, presence: true
    validates_format_of :date, :with => /\A[0-1][0-9]-[0-3][0-9]-(?:[0-9][0-9])\z/i, message: "must follow mm-dd-yy format."
    validates :time, presence: true
    validates_format_of :time, :with => /\A(0?[1-9]|1[0-2]):([0-5]\d)((?:A|P)\.?M\.?)\z/i, message: "must follow this format: 05:30PM"
    has_many :tickets, dependent: :destroy
    has_many :users, through: :tickets
end
