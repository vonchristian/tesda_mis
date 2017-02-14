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

  multisearchable :against => [:last_name, :middle_name, :first_name], :order_within_rank => "clients.created_at DESC"
  pg_search_scope :text_search, :against => [:last_name, :first_name]
  has_many :completed_trainings, class_name: "Clients::CompletedTraining"
  has_many :trainings, through: :completed_trainings
  has_many :educations, class_name: 'Clients::Education'
  has_many :educational_attainments, through: :educations, class_name: 'Configurations::EducationalAttainment'
  has_many :assessments, as: :assessee
  has_many :certifications
  has_many :assessorships, class_name: "Clients::Assessor"
  has_many :assessorship_accreditations, through: :assessorships, class_name: "Accreditation", source: :accreditations
  has_many :trainorships, class_name: "Clients::Trainor"

  has_many :conducted_assessments, through: :assessorships
  has_many :conducted_trainings, through: :trainorships
  has_many :addresses, as: :addressable


  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  validates :first_name, :middle_name, :last_name, presence: true

  enum sex: [:male, :female]
  def name 
    full_name
  end
  def current_address
    if addresses.present?
   addresses.last.details 
  end
  end

  def last_and_first_name
    "#{last_name}, #{first_name} #{middle_name.first}."
  end
  def full_name
    "#{first_name} #{middle_name.try(:first)}. #{last_name}"
  end
end
