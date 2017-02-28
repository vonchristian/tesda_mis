module Certifications
  class CertificateOfCompetencyPdf < Prawn::Document
    TABLE_WIDTHS = [45, 155]
    TABLE_WIDTHS_2 = [45, 175]

    def initialize(certification, view_context)
      super(margin: 20, page_size: "A4", page_layout: :portrait)
      @certification = certification
      @view_context = view_context
      certified_candidate
      competency
      qualification
      display_basic_competencies
      display_core_competencies
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
    def display_basic_competencies
      font("#{Rails.root.to_s}/app/assets/fonts/Arial_Narrow.ttf") do
        bounding_box [100, 478], width: 220 do
          table(competencies_table_data, header: true, cell_style: { size: 8, :padding => [0,0,1,0] },  column_widths: TABLE_WIDTHS_2) do
            cells.borders = []
            row(0).size = 9
          end
        end
      end
    end

    def competencies_table_data
      [["Unit Code", "Unit Title"]] + 
      @basic_table_data ||= @certification.competency.qualification.competencies.basic_and_common.map { |e| [e.unit_code, e.unit_title]}     
    end
    def display_core_competencies
      font("#{Rails.root.to_s}/app/assets/fonts/Arial_Narrow.ttf") do
        bounding_box [335, 478], width: 200 do
          table(core_competencies_table_data, header: true, cell_style: { size: 8, :padding => [0,0,1,0] }, column_widths: TABLE_WIDTHS) do
            cells.borders = []
            row(0).size = 9
          end
        end
      end
    end

    def core_competencies_table_data
      [["Unit Code", "Unit Title"]] + 
     [["#{@certification.competency.unit_code}", "#{@certification.competency.unit_title}"]]    
    end
    
    def certification_number
      bounding_box [150, 193], width: 400 do
        font("#{Rails.root.to_s}/app/assets/fonts/Arial_Bold.ttf") do
          text "#{@certification.number}", size: 11
        end
      end
    end

    def issued_date
      bounding_box [425, 208], width: 400 do
        font("#{Rails.root.to_s}/app/assets/fonts/Arial_Bold.ttf") do
          text "#{@certification.issue_date.strftime("%B %e, %Y")}"
        end
      end
    end
    def expiry_date
      bounding_box [425, 193], width: 400 do
        font("#{Rails.root.to_s}/app/assets/fonts/Arial_Bold.ttf") do
          text "#{@certification.expiry_date.strftime("%B %e, %Y")}"
        end
      end
    end
    def signatory_signature
      bounding_box [190, 144], width: 400 do
        image "#{@certification.signatory.signature.path}", height: 100, width: 200
      end
    end
    def signatory 
      bounding_box [80, 93], width: 400 do
        font("#{Rails.root.to_s}/app/assets/fonts/Book_Antiqua_Bold.ttf") do
          text "#{@certification.signatory_full_name.upcase}", align: :center, size: 14
        end
        text "#{@certification.signatory_designation.gsub("Director General", "")}", align: :center
      end
    end
  end
end

