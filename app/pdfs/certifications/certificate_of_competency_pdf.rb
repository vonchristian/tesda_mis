module Certifications
  class CertificateOfCompetencyPdf < Prawn::Document

    def initialize(certification, view_context)
      super(margin: 20, page_size: [612, 1008], page_layout: :portrait)
      @certification = certification
      @view_context = view_context
      certified_candidate
      competency
      certification_number
      issued_date
      expiry_date
    end

    def certified_candidate
      bounding_box [100, 650], width: 400 do
        font("#{Rails.root.to_s}/app/assets/fonts/Book_Antiqua_Bold.ttf") do
          text "#{@certification.client.full_name.upcase}", size: 22,  align: :center
        end
      end
    end
    def competency
      bounding_box [100, 750], width: 400 do
        font("#{Rails.root.to_s}/app/assets/fonts/Arial_Narrow.ttf") do
          text "#{@certification.competency_name}", size: 8,  align: :center
        end
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
