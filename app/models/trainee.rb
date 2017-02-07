class Trainee < ApplicationRecord
  has_many :educations, class_name: "Trainees::Education"
  has_many :educational_attainments, through: :educations
  has_many :trainee_trainings, class_name: "Trainees::TraineeTraining"
  has_many :trainings, through: :trainee_trainings
  validates :first_name, :middle_name, :last_name, presence: true

  enum sex: [:male, :female]

  accepts_nested_attributes_for :educations

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
