class Issuance < ApplicationRecord
  belongs_to :issuable, polymorphic: true
  validates :reference_number, :issue_date, presence: true
  validates :reference_number, uniqueness: true
end
