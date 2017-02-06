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


  def parse_for_records
    book = Spreadsheet.open(self.sheet.path)
    sheet = book.worksheet(0)
    sheet.each 1 do |row|
    if !row[0].nil?
      region = Region.find_or_create_by(name: row[0])
      province = Regions::Province.find_or_create_by(name: row[1])
      sector = Sector.find_or_create_by(name: row[19])
      training_center = TrainingCenter.find_or_create_by!(name: row[14])
      company = Company.find_or_create_by(name: row[15])
      trainee = Trainee.find_or_create_by(last_name: row[3], first_name: row[4], middle_name: row[5], date_of_birth: row[6], contact_number: row[10], sex: row[11].strip.downcase)
      educational_attainment = EducationalAttainment.find_or_create_by(title: row[12])
      Trainees::Education.find_or_create_by(educational_attainment: educational_attainment, trainee: trainee)
      qualification = Qualification.find_or_create_by(name: row[21])
      competency = Qualifications::Competency.find_or_create_by(qualification: qualification, unit_title: row[13])
      client_type = ClientType.find_or_create_by(name: row[8])
      modality = Modality.find_or_create_by(name: row[7])
      training = Training.find_or_create_by(competency: competency, training_center: training_center)
      #tom implement adddress
      # address = row[9]

      trainee_training = Trainees::TraineeTraining.find_or_create_by(region: region, province: province, reference_number: row[2], trainee: trainee, modality: modality, client_type: client_type, training: training)

      assessor_full_name = row[17]
      assessor_last_name = assessor_full_name.split.first
      assessor_middle_name = assessor_full_name.split.last
      assessor_first_name = assessor_full_name.gsub(assessor_full_name.split.last, "").gsub(assessor_full_name.split.first, "").strip

      assessor = Assessor.find_or_create_by(first_name: assessor_first_name, middle_name: assessor_middle_name, last_name: assessor_last_name)
      Assessors::Accreditation.find_or_create_by(assessor: assessor, qualification: qualification, number: row[18].to_i)
      assessment_center = AssessmentCenter.find_or_create_by!(name: row[16])
      assessment = Assessment.find_or_create_by(trainee: trainee, assessor: assessor, trainee_training: trainee_training, result: row[23].downcase.parameterize.gsub("-", "_")
  )
      Assessments::Certificate.find_or_create_by(type: "Certificates::#{row[20].strip.gsub(" ", "")}", trainee: trainee, date_issued: row[25], expiry_date: row[26], number: row[24].to_i, certified: assessment)
    end
  end
  end
end
