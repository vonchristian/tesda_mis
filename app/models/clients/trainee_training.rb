module Trainees
  class TraineeTraining < ApplicationRecord
    has_one :assessment
    belongs_to :registry
    belongs_to :trainee
    belongs_to :training
    belongs_to :training_center
    belongs_to :region
    belongs_to :province, class_name: "Regions::Province"
    belongs_to :modality
    belongs_to :client_type
    belongs_to :company



    delegate :name, to: :training, prefix: true
    delegate :qualification, to: :training
    delegate :name, to: :qualification, prefix: true, allow_nil: true
    delegate :name, to: :region, prefix: true
    delegate :name, to: :province, prefix: true
    delegate :last_name, to: :trainee, prefix: true
    delegate :first_name, to: :trainee, prefix: true
    delegate :middle_name, to: :trainee, prefix: true
    delegate :sex, to: :trainee, prefix: true


    delegate :date_of_birth, to: :trainee, prefix: true
    delegate :name, to: :modality, prefix: true
    delegate :name, to: :client_type, prefix: true
    delegate :name, to: :training_center, prefix: true

    delegate :full_name, to: :assessor, prefix: true
    delegate :full_name, to: :assessor, prefix: true

    delegate :sector, to: :qualification
    delegate :name, to: :sector, prefix: true, allow_nil: true

  def assessor
    assessment.assessor
  end
  def qualification
    training.competency.qualification
  end
  def assessor_accreditation_number
    assessor.accreditations.where(qualification: qualification).first.number
  end
  def type_of_certificate
    assessment.type_of_certificate
  end
  end
end
