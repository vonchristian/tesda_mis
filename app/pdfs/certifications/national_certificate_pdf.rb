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
      issued_on
      expiry_date
      signatory
    end
    def level
      bounding_box [420, 850], width: 100 do
          text "#{@certification.certification_level_level}", size: 20
    end
    end

    def qualification
      bounding_box [90, 750], width: 400 do
        font("#{Rails.root.to_s}/app/assets/fonts/Book_Antiqua_Bold.ttf") do
        text "#{@certification.qualification_name_without_cert_level.upcase}", size: 20, align: :center
      end
    end
    end

    def certified
      bounding_box [100, 650], width: 400 do
        font("#{Rails.root.to_s}/app/assets/fonts/Book_Antiqua_Bold.ttf") do
        text "#{@certification.client.full_name.upcase}", size: 22, align: :center
      end
      end
    end
    def certification_number
      bounding_box [100, 380], width: 400 do
        font("#{Rails.root.to_s}/app/assets/fonts/Arial_Bold.ttf") do
          text "#{@certification.number}", size: 11, style: :bold
        end
      end
    end

    def issued_on
      bounding_box [400, 350], width: 400 do
        font("#{Rails.root.to_s}/app/assets/fonts/Arial_Bold.ttf") do
          text "#{@certification.issue_date.strftime("%b. %e, %Y")}", size: 11
        end
      end
    end
    def expiry_date
      bounding_box [400, 330], width: 400 do
        font("#{Rails.root.to_s}/app/assets/fonts/Arial_Bold.ttf") do
          text "#{@certification.expiry_date.strftime("%b. %e, %Y")}", size: 11
        end
      end
    end

    def signatory 
      text "#{@certification.signatory_full_name}", align: :center
      text "#{@certification.signatory_designation}", align: :center

    end

  end
end
