class Journal < ApplicationRecord
  text
  belongs_to :patient, index: true, foreign_key: true
end
