class Issuance < ApplicationRecord
  include PgSearch
  multisearchable :against => [:reference_number, :client_full_name, :client_last_name, :client_first_name]
  pg_search_scope :text_search, :against => [:reference_number]
  belongs_to :issuable, polymorphic: true
  belongs_to :issuer, class_name: "User", foreign_key: "user_id"
  
  validates :reference_number, :issue_date, presence: true
  validates :reference_number, uniqueness: true

  delegate :client_last_name, :name, :type_name, to: :issuable, allow_nil: true
  delegate :client_first_name, :name, :type_name, to: :issuable, allow_nil: true
  delegate :client_full_name, :name, :type_name, to: :issuable, allow_nil: true
  delegate :client_middle_name, :name, :type_name, to: :issuable
  delegate :number, to: :issuable, prefix: true
  delegate :assessment_date, to: :issuable, prefix: true
  delegate :full_name, to: :issuer, prefix: true, allow_nil: true


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
