module Certifications
  class PerMunicipalityPdf < Prawn::Document 
    TABLE_WIDTHS = [160, 200, 50, 120]

    def initialize(municipality, clients, view_context)
      super(margin: 40, page_size: [612, 1008], page_layout: :portrait)
      @municipality = municipality
      @clients = clients 
      @view_context = view_context
      logo
      heading
      certificates_heading
      display_clients_table
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
      text "LIST OF CLIENTS IN #{@municipality.name.try(:upcase)}", align: :center, size: 14, style: :bold
      move_down 3
       stroke_horizontal_rule
    end 
    def display_clients_table
      if @clients.blank?
        move_down 10
        text "No  clients found.", align: :center
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
      [["CLIENT", "ADDRESS", "GENDER", "CONTACT NUMBER"]] +
      @table_data ||= @clients.map { |e| [e.full_name.try(:titleize), e.current_address.try(:details), e.sex, e.contact_number]}
    end
  end
end