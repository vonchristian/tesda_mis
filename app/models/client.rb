class Client < ApplicationRecord
  include PgSearch
  extend FriendlyId
  friendly_id :full_name, use: :slugged
  has_attached_file :avatar,
  styles: { large: "120x120>",
            medium: "70x70>",
            thumb: "40x40>",
            small: "30x30>",
            x_small: "20x20>"},
  default_url: ":style/profile_default.jpg",
  :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
  :url => "/system/:attachment/:id/:style/:filename"

  multisearchable :against => [:last_name, :middle_name, :first_name, :full_name], :order_within_rank => "clients.created_at DESC"
  pg_search_scope :text_search, :against => [:last_name, :first_name]
  has_many :completed_trainings, class_name: "Clients::CompletedTraining"
  has_many :trainings, through: :completed_trainings
  has_many :educations, class_name: 'Clients::Education'
  has_many :educational_attainments, through: :educations, class_name: 'Configurations::EducationalAttainment'
  has_many :assessments, as: :assessee
  has_many :certifications
  has_many :national_certificates, class_name: "Certifications::NationalCertificate"
  has_many :certificate_of_competencies, class_name: "Certifications::CertificateOfCompetency"

  has_many :assessorships, class_name: "Clients::Assessor"
  has_many :assessorship_accreditations, through: :assessorships, class_name: "Accreditation", source: :accreditations
  has_many :trainorships, class_name: "Clients::Trainor"

  has_many :conducted_assessments, through: :assessorships
  has_many :conducted_trainings, through: :trainorships
  has_many :addresses, as: :addressable
  has_many :municipality_or_cities, through: :addresses


  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  validates :first_name, :middle_name, :last_name, presence: true
  validates :full_name, uniqueness: true

  enum sex: [:male, :female]

  before_save :set_full_name
  def self.parse_for_client(record)
    if record.present?
      if record.split.count == 2
        first_name = record.split.first
        middle_name = record.split.last
        last_name = record.split.last
      elsif record.split.count == 3
        first_name = record.split.first
        middle_name = record.split.second
        last_name = record.split.last
      elsif record.split.count == 4
        first_name = record.split.first(2).join.titleize
        middle_name = record.split.third
        last_name = record.split.last
      elsif record.split.count == 5
        first_name = record.split.first(3).join.titleize
        middle_name = record.split.fourth
        last_name = record.split.last
      end
      first_name
      middle_name
      last_name
      full_name = first_name + " " + middle_name + " " + last_name
      client = Client.where(first_name: first_name, middle_name: middle_name, last_name: last_name, full_name: full_name).first
      if client.nil?
        Client.find_or_create_by(first_name: first_name, middle_name: middle_name, last_name: last_name, full_name: full_name)
      end
    end  
  end
  def name 
    full_name
  end
  def current_address
    if addresses.present?
      addresses.last
    end
  end

  def last_and_first_name
    "#{last_name}, #{first_name} #{middle_name.first}."
  end

  def first_and_last_name
    "#{first_name} #{last_name}"
  end

  def fullname
    "#{first_name} #{middle_name} #{last_name}"
  end
  
  def name_with_middle_initial
    "#{first_name} #{middle_name.first}. #{last_name}"
  end

  def certification_from(registry)
    certifications.where(registry: registry)
  end



  private 
  def set_full_name
    self.full_name ||= self.fullname
  end
end
