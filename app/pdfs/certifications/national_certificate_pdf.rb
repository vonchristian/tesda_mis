module Certifications
  class NationalCertificatePdf < Prawn::Document

    def initialize(certification, view_context)
      super(margin: 20, page_size: [612, 1008], page_layout: :portrait)
      @certification = certification
      @view_context = view_context
      level
      qualification
      certified
      certification_number
      issued_date
      expiry_date
    end
    def level
      bounding_box [420, 850], width: 100 do
          text "#{@certification.certification_level_level}", size: 20
    end
    end

    def qualification
      bounding_box [90, 750], width: 400 do
        font("#{Rails.root.to_s}/app/assets/fonts/BookAntiqua.ttf") do
        text "#{@certification.qualification_name_without_cert_level.upcase}", size: 20, align: :center
      end
    end
    end

    def certified
      bounding_box [100, 650], width: 400 do
        font("#{Rails.root.to_s}/app/assets/fonts/BookAntiqua.ttf") do
        text "#{@certification.client.full_name.upcase}", size: 22, align: :center
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
