class Client < ApplicationRecord
  include PgSearch
  # multisearchable :against => [:last_name]
  pg_search_scope :text_search, :against => [:last_name, :first_name]
  has_many :completed_trainings, class_name: "Clients::CompletedTraining"
  has_many :trainings, through: :completed_trainings
  has_many :educations, class_name: 'Clients::Education'
  has_many :educational_attainments, through: :educations, class_name: 'Configurations::EducationalAttainment'
  has_many :assessments, as: :assessee
  has_many :certifications, through: :assessments
  has_many :assessorships, class_name: "Clients::Assessor"
  has_many :assessorship_accreditations, through: :assessorships, class_name: "Accreditation", source: :accreditations
  has_many :trainorships, class_name: "Clients::Trainor"

  has_many :conducted_assessments, through: :assessorships
  has_many :conducted_trainings, through: :trainorships
  has_many :addresses, as: :addressable



  validates :first_name, :middle_name, :last_name, presence: true

  enum sex: [:male, :female]
 
#   has_many :educations, class_name: "Trainees::Education"
#   has_many :educational_attainments, through: :educations
#   has_many :trainee_trainings, class_name: "Trainees::TraineeTraining"
#   has_many :trainings, through: :trainee_trainings
#   has_many :assessments, through: :trainee_trainings
#   has_many :national_certificates, through: :assessments, class_name: "Certificates::NationalCertificate", source: :certificate
#   has_many :certificate_of_competencies, through: :assessments, class_name: "Certificates::CertificateOfCompetency", source: :certificate
#
#   validates :first_name, :middle_name, :last_name, presence: true
#
#   enum sex: [:male, :female]
#
#   accepts_nested_attributes_for :educations
#
#   has_attached_file :avatar, styles: { medium: "300x300>",
#                                                            thumb: "100x100#", small: "50x50#"}, default_url: ":style/profile_default.jpg"
#
# validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
#
  def last_and_first_name
    "#{last_name}, #{first_name} #{middle_name.first}."
  end
  def full_name
    "#{first_name} #{middle_name.first}. #{last_name}"
  end
#   def first_and_last_name
#     "#{first_name} #{last_name}"
#   end
end
