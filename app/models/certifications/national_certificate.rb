module Certifications 
  class NationalCertificate < Certification
    def name 
      "#{client_full_name} - NC"
    end
  end 
end 