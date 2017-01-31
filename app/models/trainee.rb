class Trainee < ApplicationRecord
  has_one :education, class_name: "Trainees::Education"
  has_one :educational_attainment, through: :education
  has_many :trainee_trainings
  has_many :trainings, through: :trainee_trainings
  validates :first_name, :middle_name, :last_name, presence: true

  enum sex: [:male, :female]

  accepts_nested_attributes_for :education
  delegate :title, to: :education, prefix: true, allow_nil: true
  has_attached_file :avatar, styles: { medium: "300x300>",
                                                           thumb: "100x100#", small: "50x50#"}, default_url: ":style/profile_default.jpg"

validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/


  def full_name
    "#{first_name} #{middle_name} #{last_name}"
  end
  def first_and_last_name
    "#{first_name} #{last_name}"
  end
end
