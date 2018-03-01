class Position < ApplicationRecord
  belongs_to :user
  belongs_to :salary
  has_many :evaluations
end
