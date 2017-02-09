class Accreditation < ApplicationRecord
  belongs_to :accredited, polymorphic: true
  belongs_to :qualification

  validates :accredited, presence: true
  validates :qualification, presence: true
  delegate :name, to: :qualification, prefix: true
end
