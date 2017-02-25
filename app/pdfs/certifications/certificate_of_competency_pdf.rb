module Certifications
  class CertificateOfCompetencyPdf < Prawn::Document

    def initialize(certification, view_context)
      super(margin: 20, page_size: "A4", page_layout: :portrait)
      @certification = certification
      @view_context = view_context
      certified_candidate
      competency
      qualification
      certification_number
      issued_date
      expiry_date
      signatory_signature
      signatory
    end

    def certified_candidate
      bounding_box [80, 547], width: 400 do
        font("#{Rails.root.to_s}/app/assets/fonts/Book_Antiqua_Bold.ttf") do
          text "#{@certification.client.full_name.try(:upcase)}", size: 22,  align: :center
        end
      end
    end
    def competency
      bounding_box [60, 650], width: 400 do
        font("#{Rails.root.to_s}/app/assets/fonts/Arial_Narrow.ttf") do
          text "#{@certification.competency_name}", size: 8,  align: :center
        end
      end
    end
    def qualification
      bounding_box [40, 280], width: 500 do
        font("#{Rails.root.to_s}/app/assets/fonts/Book_Antiqua_Bold.ttf") do
          text "#{@certification.competency_qualification_name.try(:upcase)}", size: 20, align: :center
        end
      end
    end
    
    def certification_number
      bounding_box [150, 207], width: 400 do
        font("#{Rails.root.to_s}/app/assets/fonts/Arial_Bold.ttf") do
          text "#{@certification.number}", size: 11
        end
      end
    end

    def issued_date
      bounding_box [425, 223], width: 400 do
        font("#{Rails.root.to_s}/app/assets/fonts/Arial_Bold.ttf") do
          text "#{@certification.issue_date.strftime("%B %e, %Y")}"
        end
      end
    end
    def expiry_date
      bounding_box [425, 207], width: 400 do
        font("#{Rails.root.to_s}/app/assets/fonts/Arial_Bold.ttf") do
          text "#{@certification.expiry_date.strftime("%B %e, %Y")}"
        end
      end
    end
    def signatory_signature
      bounding_box [200, 140], width: 400 do
        image "#{@certification.signatory.signature.path}", height: 70, width: 140
      end
    end
    def signatory 
      bounding_box [80, 110], width: 400 do
        font("#{Rails.root.to_s}/app/assets/fonts/Book_Antiqua_Bold.ttf") do
          text "#{@certification.signatory_full_name.upcase}", align: :center, size: 14
        end
        text "#{@certification.signatory_designation.gsub("Director General", "")}", align: :center
      end
    end
  end
end
