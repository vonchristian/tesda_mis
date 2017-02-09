module Certifications
  class NationalCertificatePdf < Prawn::Document

    def initialize(certificate, view_context)
      super(margin: 20, page_size: [612, 1008], page_layout: :portrait)
      @certificate = certificate
      @view_context = view_context
      level
      qualification
      certified
      certificate_number
      issued_date
      expiry_date
    end
    def level
      bounding_box [420, 850], width: 100 do
        text "#{@certificate.certification_level_level}", size: 25, style: :bold
      end
    end

    def qualification
      bounding_box [100, 750], width: 400 do
        text "#{@certificate.qualification.name.upcase}", size: 25, style: :bold, align: :center
      end
    end

    def certified
      bounding_box [100, 650], width: 400 do
        text "#{@certificate.client.full_name.upcase}", size: 25, style: :bold, align: :center
      end
    end
    def certificate_number
      text "<b>#{@certificate.number}</b>"
    end

    def issued_date
      text "#{@certificate.issue_date.strftime("%b. %e, %Y")}"
    end
    def expiry_date
      text "#{@certificate.expiry_date.strftime("%b. %e, %Y")}"
    end

  end
end
