class Issuance < ApplicationRecord
  belongs_to :issuable, polymorphic: true
  validates :reference_number, :issue_date, presence: true
  validates :reference_number, uniqueness: true

  delegate :client_full_name, :name, :type_name, to: :issuable

  def self.issued_on(hash={})
    if hash[:from_date] && hash[:to_date]
      from_date = hash[:from_date].kind_of?(Time) ? hash[:from_date] : Time.parse(hash[:from_date].strftime('%Y-%m-%d 12:00:00'))
      to_date = hash[:to_date].kind_of?(Time) ? hash[:to_date] : Time.parse(hash[:to_date].strftime('%Y-%m-%d 12:59:59'))
      where('issuances.issue_date' => from_date..to_date)
    else
      expired
    end
  end
end
