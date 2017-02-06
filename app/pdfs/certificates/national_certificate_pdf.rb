module Certificates
  class NationalCertificatePdf < Prawn::Document

    def initialize(certificate, view_context)
      super(margin: 20, page_size: [612, 1008], page_layout: :portrait)
      @certificate = certificate
      @view_context = view_context
      level
      qualification
      certified
    end
    def level
      bounding_box [420, 850], width: 100 do
        text "II", size: 25, style: :bold
      end
    end

    def qualification
      bounding_box [100, 750], width: 400 do
        text "#{@certificate.qualification.name}", size: 25, style: :bold, align: :center
      end
    end

    def certified
      bounding_box [100, 650], width: 400 do
        text "#{@certificate.trainee.full_name}", size: 25, style: :bold, align: :center
      end
    end
  end
end
