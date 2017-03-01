module Certifications
  class NationalCertificatePdf < Prawn::Document
    TABLE_WIDTHS = [45, 155]
    TABLE_WIDTHS_2 = [45, 175]


    def initialize(certification, view_context)
      super(margin: 20, page_size: "A4", page_layout: :portrait)
      @certification = certification
      @view_context = view_context
      tesda_revision
      level
      qualification
      certified_candidate
      display_basic_competencies
      display_core_competencies
      certification_number
      issued_date
      expiry_date
      signatory_signature
      signatory
    end
    
    def tesda_revision
      bounding_box [400, 800], width: 100 do 
        text "TESDA-SOP-CO-08-F32", size: 8
      end
    end

    def level
      bounding_box [460, 632], width: 100 do
        font("#{Rails.root.to_s}/app/assets/fonts/Book_Antiqua_Bold.ttf") do
          text "#{@certification.certification_level_level}", size: 25
        end
      end
    end

    def qualification
      if @certification.qualification_name_without_cert_level.size <= 28
        bounding_box [70, 552], width: 420 do
          font("#{Rails.root.to_s}/app/assets/fonts/Book_Antiqua_Bold.ttf") do
            text "#{@certification.qualification_name_without_cert_level.try(:upcase)}", size: 22,  align: :center
          end
        end
      elsif @certification.qualification_name_without_cert_level.size > 28
        bounding_box [70, 572], width: 420 do
          font("#{Rails.root.to_s}/app/assets/fonts/Book_Antiqua_Bold.ttf") do
            text "#{@certification.qualification_name_without_cert_level.try(:upcase)}", size: 22,  align: :center
          end
        end
      end
    end

    def certified_candidate
      bounding_box [80, 490], width: 400 do
        font("#{Rails.root.to_s}/app/assets/fonts/Book_Antiqua_Bold.ttf") do
          text "#{@certification.client.fullname.try(:upcase)}", size: 22,  align: :center
        end
      end
    end

    def display_basic_competencies
      font("#{Rails.root.to_s}/app/assets/fonts/Arial_Narrow.ttf") do
        bounding_box [120, 390], width: 220 do
          table(competencies_table_data, header: true, cell_style: { size: 8, :padding => [0,0,1,0] },  column_widths: TABLE_WIDTHS_2) do
            cells.borders = []
            row(0).size = 9
          end
        end
      end
    end

    def competencies_table_data
      [["Unit Code", "Unit Title"]] + 
      @basic_table_data ||= @certification.competencies.basic_and_common.map { |e| [e.unit_code, e.unit_title]}     
    end

    def certification_number
      bounding_box [148, 177], width: 400 do
        font("#{Rails.root.to_s}/app/assets/fonts/Arial_Bold.ttf") do
          text "#{@certification.number}", size: 11
        end
      end
    end

    def display_core_competencies
      font("#{Rails.root.to_s}/app/assets/fonts/Arial_Narrow.ttf") do
        bounding_box [335, 390], width: 200 do
          table(core_competencies_table_data, header: true, cell_style: { size: 8, :padding => [0,0,1,0] }, column_widths: TABLE_WIDTHS) do
            cells.borders = []
            row(0).size = 9
          end
        end
      end
    end

    def core_competencies_table_data
      [["Unit Code", "Unit Title"]] + 
      @core_table_data ||= @certification.competencies.core.map { |e| [e.unit_code, e.unit_title]}     
    end

    def certification_number
      bounding_box [148, 177], width: 400 do
        font("#{Rails.root.to_s}/app/assets/fonts/Arial_Bold.ttf") do
          text "#{@certification.number}", size: 11
        end
      end
    end

    def issued_date
      bounding_box [428, 191], width: 400 do
        font("#{Rails.root.to_s}/app/assets/fonts/Arial_Bold.ttf") do
          text "#{@certification.issue_date.strftime("%B %e, %Y")}"
        end
      end
    end
    def expiry_date
      bounding_box [428, 177], width: 400 do
        font("#{Rails.root.to_s}/app/assets/fonts/Arial_Bold.ttf") do
          text "#{@certification.expiry_date.strftime("%B %e, %Y")}"
        end
      end
    end
    def signatory_signature
      bounding_box [195, 145], width: 400 do
        image "#{@certification.signatory.signature.path}", height: 100, width: 200
      end
    end
    def signatory 
      bounding_box [80, 94], width: 400 do
        font("#{Rails.root.to_s}/app/assets/fonts/Book_Antiqua_Bold.ttf") do
          text "#{@certification.signatory_full_name.upcase}", align: :center, size: 14
        end
        text "#{@certification.signatory_designation.gsub("Director General", "")}", align: :center
      end
    end

  end
end
