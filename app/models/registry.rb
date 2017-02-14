class Registry < ApplicationRecord
  include PgSearch
  pg_search_scope( :text_search, against: [:name, :spreadsheet_file_name], using: { tsearch: { prefix: true }} )
  has_attached_file :spreadsheet, :path => ":rails_root/public/system/:attachment/:id/:filename"

  has_many :client_trainings, class_name: "Clients::CompletedTraining", counter_cache: true, dependent: :destroy
  validates :spreadsheet, presence: true
  validates :name, presence: true, uniqueness: true
  do_not_validate_attachment_file_type :spreadsheet
  # validates_attachment :spreadsheet, presence: true,
  #                    content_type: { content_type: [
  #                      "application/vnd.ms-excel",
  #                      "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
  #                    ]
  #                    },
  #                    message: ' Only EXCEL files are allowed.'

  # after_commit :parse_for_records
end
