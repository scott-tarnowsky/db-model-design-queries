class Patient < ApplicationRecord
  has_many :journals
  has_many :engagement_plans
  has_many :providers, through: :engagement_plans
end
