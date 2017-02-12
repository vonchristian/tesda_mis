module Certifications 
  class ExpiredCertificationsPdf < Prawn::Document
    TABLE_WIDTHS = [200,230,100]

    def initialize(certifications, view_context)
      super(margin: 40, page_size: [612, 1008], page_layout: :portrait)
      @certifications = certifications
      @view_context = view_context
      logo
      heading
      certificates_heading
      display_certifications_table
    end 

    def logo
      bounding_box [0, 950], width: 50 do
        image "#{Rails.root}/app/assets/images/tesda_logo.png", height: 60, width: 60
      end
    end

    def heading
      bounding_box [50, 940], width: 500 do
        text "TECHNICAL EDUCATION AND SKILLS DEVELOPMENT AUTHORITY", style: :bold, align: :center, size: 12
        text "Rock Quarry, Poblacion North, Lagawe, Ifugao", align: :center, size: 10
      end
    end
    def certificates_heading
      move_down 50
      text "LIST OF EXPIRED CERTIFICATES", align: :center, size: 12, style: :bold
      text "(As of #{Time.zone.now.strftime("%B %e, %Y")})", align: :center, style: :bold, size: 10
      move_down 3
       stroke_horizontal_rule
    end 
    def display_certifications_table
      if @certifications.blank?
        move_down 10
        text "No  expired certificates.", align: :center
      else
        move_down 10
        table(table_data, header: true, cell_style: { size: 8, font: "Helvetica"}, column_widths: TABLE_WIDTHS) do
          row(0).font_style = :bold
          row(0).background_color = 'DDDDDD'
        end
      end
    end

    def table_data
      move_down 5
      [["CLIENT", "Qualification/Competency", "Expiry Date"]] +
      @table_data ||= @certifications.map { |e| [e.client_full_name, e.name, e.expiry_date.strftime('%b %e, %Y')]}
    end
  end
end
  
