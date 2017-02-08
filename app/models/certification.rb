class Certification < ApplicationRecord
  belongs_to :certified, polymorphic: true
  belongs_to :certification_type, class_name: "Certifications::CertificationType"
  belongs_to :certification_level, class_name: "Configurations::CertificationLevel"
end
