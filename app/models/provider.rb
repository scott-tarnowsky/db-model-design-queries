class Provider < ApplicationRecord
  has_many :engagement_plans
  has_many :patients, through: :engagement_plans
end
