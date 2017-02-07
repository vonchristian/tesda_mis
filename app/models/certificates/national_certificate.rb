module Certificates
  class NationalCertificate < Assessments::Certificate
    def qualification
      certified.trainee_training.training.qualification
    end
  end
end
