class Registry < ApplicationRecord
  include PgSearch
  pg_search_scope( :text_search,
                    against: [:name, :spreadsheet_file_name],
                    using: { tsearch: { prefix: true }} )
  has_attached_file :spreadsheet,
                  :path => ":rails_root/public/system/:attachment/:id/:filename"

  # validates_attachment :spreadsheet, presence: true,
  #                    content_type: { content_type: [
  #                      "application/vnd.ms-excel",
  #                      "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
  #                    ]
  #                    },
  #                    message: ' Only EXCEL files are allowed.'

  has_many :client_trainings, class_name: "Clients::CompletedTraining"
  do_not_validate_attachment_file_type :spreadsheet
  # after_commit :parse_for_records
  validates :spreadsheet, presence: true
  validates :name, presence: true, uniqueness: true
  def training_center
    trainee_trainings.last.training.training_center.name
  end

  def assessment_center
    trainee_trainings.last.assessment.assessment_center.name
  end



  def parse_for_records
    book = Spreadsheet.open(self.spreadsheet.path)
    sheet = book.worksheet(0)
    sheet.each 1 do |row|
    if !row[0].nil?
      region = Addresses::Region.find_or_create_by(name: row[0])
      province = Addresses::Province.find_or_create_by(name: row[1])
      sector = Sector.find_or_create_by(name: row[19])
      qualification = Qualification.find_or_create_by(name: row[21], sector: sector)

      institution = Institution.find_or_create_by(name: row[24])
      training_center_accreditation = Accreditation.find_or_create_by(accredited: institution, qualification: qualification)
      training_center = Institutions::TrainingCenter.find_or_create_by(institution: institution)
      # company = Company.find_or_create_by(name: row[15])
      client = Client.find_or_create_by(last_name: row[3], first_name: row[4], middle_name: row[5], date_of_birth: row[6], contact_number: row[10], sex: row[11].strip.downcase)
      educational_attainment = Configurations::EducationalAttainment.find_or_create_by(name: row[12])
      Clients::Education.find_or_create_by(educational_attainment: educational_attainment, client: client)

      competency = Qualifications::Competency.find_or_create_by(qualification: qualification, unit_title: row[13])
      client_type = Configurations::ClientType.find_or_create_by(name: row[8])
      modality = Configurations::Modality.find_or_create_by(name: row[7])
      training = Training.find_or_create_by(competency: competency, training_center_id: training_center.id)
      #tom implement adddress
      # address = row[9]

      completed_training = Clients::CompletedTraining.find_or_create_by(region: region, province: province, reference_number: row[2], client: client, modality: modality, client_type: client_type, training: training, registry: self)

      assessor_full_name = row[17]
      assessor_last_name = assessor_full_name.split.first
      assessor_middle_name = assessor_full_name.split.last
      assessor_first_name = assessor_full_name.gsub(assessor_full_name.split.last, "").gsub(assessor_full_name.split.first, "").strip

      assessor = Client.find_or_create_by(first_name: assessor_first_name, middle_name: assessor_middle_name, last_name: assessor_last_name)
      assessor_accreditation = Accreditation.find_or_create_by(accredited: assessor, qualification: qualification, number: row[18].to_i)
      assessorship = Clients::Assessor.find_or_create_by(client: assessor)
      assessment_institution = Institution.find_or_create_by(name: row[16])
      assessment_center = Institutions::AssessmentCenter.find_or_create_by(institution: assessment_institution)
      assessment_center_accreditation = Accreditation.find_or_create_by(accredited: assessment_center, qualification: qualification)

      assessment = Assessment.find_or_create_by(assessee: completed_training, assessor: assessorship, assessment_center: assessment_center, result: row[23].downcase.parameterize.gsub("-", "_"))
      certification_type = Certifications::CertificationType.find_or_create_by(name: row[23])
      certification = Certification.find_or_create_by( certified: assessment, issue_date: row[25], expiry_date: row[26], number: row[24].to_i, certification_type: certification_type)
    end
  end
  end
end
