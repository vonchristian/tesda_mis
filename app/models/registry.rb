class Registry < ApplicationRecord
  has_attached_file :sheet,
                  :path => ":rails_root/public/system/:attachment/:id/:filename"

  # validates_attachment :sheet, presence: true,
  #                    content_type: { content_type: [
  #                      "application/vnd.ms-excel",
  #                      "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
  #                    ]
  #                    },
  #                    message: ' Only EXCEL files are allowed.'
  do_not_validate_attachment_file_type :sheet
  after_commit :parse_for_records
  def open_file(file)
    case File.extname(file.original_filename)
      when '.xls' then Roo::Excel.new(file.path)
      when '.xlsx' then Roo::Excelx.new(file.path)

      else raise "Unknown file type: #{file.original_filename}"
    end
  end

  private
  def parse_for_records
  end
                   end
