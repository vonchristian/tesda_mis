module Certifications
  class NationalCertificatePdf < Prawn::Document

    def initialize(certification, view_context)
      super(margin: 20, page_size: "A4", page_layout: :portrait)
      @certification = certification
      @view_context = view_context
      level
      qualification
      certified_candidate
      certification_number
      issued_date
      expiry_date
      signatory_signature
      signatory

    end
    def level
      bounding_box [455, 634], width: 100 do
        font("#{Rails.root.to_s}/app/assets/fonts/Book_Antiqua_Bold.ttf") do
          text "#{@certification.certification_level_level}", size: 25
        end
    end
    end

     def qualification
      bounding_box [80, 552], width: 400 do
        font("#{Rails.root.to_s}/app/assets/fonts/Book_Antiqua_Bold.ttf") do
          text "#{@certification.qualification_name_without_cert_level.upcase}", size: 22,  align: :center
        end
      end
    end

    def certified_candidate
      bounding_box [80, 490], width: 400 do
        font("#{Rails.root.to_s}/app/assets/fonts/Book_Antiqua_Bold.ttf") do
          text "#{@certification.client.full_name.upcase}", size: 22,  align: :center
        end
      end
    end
    def certification_number
      bounding_box [148, 182], width: 400 do
        font("#{Rails.root.to_s}/app/assets/fonts/Arial_Bold.ttf") do
          text "#{@certification.number}", size: 11
        end
      end
    end

    def issued_date
      bounding_box [423, 197], width: 400 do
        font("#{Rails.root.to_s}/app/assets/fonts/Arial_Bold.ttf") do
          text "#{@certification.issue_date.strftime("%B %e, %Y")}"
        end
      end
    end
    def expiry_date
      bounding_box [423, 182], width: 400 do
        font("#{Rails.root.to_s}/app/assets/fonts/Arial_Bold.ttf") do
          text "#{@certification.expiry_date.strftime("%B %e, %Y")}"
        end
      end
    end
    def signatory_signature
      bounding_box [200, 145], width: 400 do
        image "#{@certification.signatory.signature.path}", height: 80, width: 160
      end
    end
    def signatory 
      bounding_box [80, 100], width: 400 do
        font("#{Rails.root.to_s}/app/assets/fonts/Book_Antiqua_Bold.ttf") do
          text "#{@certification.signatory_full_name.upcase}", align: :center, size: 14
        end
        text "#{@certification.signatory_designation.gsub("Director General", "")}", align: :center
      end
    end

  end
end
