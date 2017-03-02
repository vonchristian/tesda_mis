class Registry < ApplicationRecord
  include PgSearch
  pg_search_scope( :text_search, against: [:name, :spreadsheet_file_name], using: { tsearch: { prefix: true }} )
  has_attached_file :spreadsheet, :path => ":rails_root/public/system/:attachment/:id/:filename"

  belongs_to :uploader, class_name: "User", foreign_key: 'user_id'
  has_many :client_trainings, class_name: "Clients::CompletedTraining", counter_cache: true, dependent: :destroy
  has_many :certifications
  has_many :certified_clients, through: :certifications, source: :client
  validates :spreadsheet, presence: true
  validates :name, presence: true
  before_validation :set_name, :set_date
  do_not_validate_attachment_file_type :spreadsheet
  # validates_attachment :spreadsheet, presence: true,
  #                    content_type: { content_type: [
  #                      "application/vnd.ms-excel",
  #                      "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
  #                    ]
  #                    },
  #                    message: ' Only EXCEL files are allowed.'

  # after_commit :parse_for_records

  delegate :full_name, to: :uploader, prefix: true, allow_nil: true
  private 
  def set_name 
    self.name ||= self.spreadsheet_file_name
  end
  def set_date 
    self.date ||= Time.zone.now
  end
end
