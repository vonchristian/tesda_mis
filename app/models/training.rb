class Training < ApplicationRecord
  has_one :assessment
  has_many :trainees
end
