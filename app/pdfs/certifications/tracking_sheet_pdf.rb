module Certifications 
  class TrackingSheetPdf < Prawn::Document
    TABLE_WIDTHS = [80, 80, 30, 80, 80,120, 60, 70, 70, 70, 90]

    def initialize(certifications, from_date, to_date, view_context)
      super(margin: 40, page_size: "LEGAL", page_layout: :landscape)
      @certifications = certifications
      @from_date = from_date
      @to_date = to_date
      @view_context = view_context
      # logo
      heading
      # certificates_heading
      display_certifications_table
    end 

    # def logo
    #   # bounding_box [0, 950], width: 50 do
    #     image "#{Rails.root}/app/assets/images/tesda_logo.png", height: 60, width: 60
    #   # end
    # end

    def heading
      # bounding_box [50, 940], width: 500 do
        text "TRACKING SHEET", style: :bold, align: :center, size: 12
        text "PREPARATION AND ISSUANCE OF CERTIFICATE", align: :center, size: 10
        text "For the Month of #{@from_date.strftime("%B").upcase}", align: :center, size: 10, inline_format: true

      # end
    end
   
    def display_certifications_table
      if @certifications.blank?
        move_down 10
        text "No  issued certificates.", align: :center
      else
        move_down 10
        table(table_data, header: true, cell_style: { size: 10, font: "Helvetica"}, column_widths: TABLE_WIDTHS) do
          row(0).font_style = :bold
          row(0).size = 7
          row(0).background_color = 'DDDDDD'
        end
      end
    end

    def table_data
      move_down 5
      [["LAST NAME", "FIRST NAME", "MI", "CLN", "CERTIFICATE #", "QUALIFICATION/COMPETENCY", "DATE OF ASSESSMENT", "DATE OF RECEIPT OF CARS BY THE PO", "DATE OF PRINTING OF NC/COC", "SIGNATURE OF CANDIDATE", "DATE CLAIMED", "ISSUED BY"]] +
      @table_data ||= @certifications.map { |e| [e.client_last_name.try(:upcase), e.client_first_name.try(:upcase), e.client_middle_name.try(:upcase).first, e.reference_number, e.issuable_number, e.name, e.assessment_date, e.cars_date_received.strftime('%b %e, %Y'), e.printing_date.strftime('%b %e, %Y'), "", e.issue_date.strftime('%b %e, %Y'), e.issuer_full_name]}
    end
  end
end
  
