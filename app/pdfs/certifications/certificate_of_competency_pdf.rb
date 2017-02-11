module Certifications
  class CertificateOfCompetencyPdf < Prawn::Document

    def initialize(certification, view_context)
      super(margin: 20, page_size: [612, 1008], page_layout: :portrait)
      @certification = certification
      @view_context = view_context
      competency
      certified
      certification_number
      issued_date
      expiry_date
    end

    def competency
      bounding_box [100, 750], width: 400 do
        text "#{@certification.competency_name.upcase}", size: 25, style: :bold, align: :center
      end
    end

    def certified
      bounding_box [100, 650], width: 400 do
        text "#{@certification.client.full_name.upcase}", size: 25, style: :bold, align: :center
      end
    end
    def certification_number
      text "<b>#{@certification.number}</b>"
    end

    def issued_date
      text "#{@certification.issue_date.strftime("%b. %e, %Y")}"
    end
    def expiry_date
      text "#{@certification.expiry_date.strftime("%b. %e, %Y")}"
    end

  end
end
