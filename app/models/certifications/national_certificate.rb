module Certifications 
  class NationalCertificate < Certification
    delegate :name, to: :qualification, prefix: true
  end 
end 