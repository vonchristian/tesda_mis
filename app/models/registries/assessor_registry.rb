module Registries 
  class AssessorRegistry < Registry
    def parse_for_records
      book = Spreadsheet.open(self.spreadsheet.path)
      sheet = book.worksheet(0)
      transaction do
        sheet.each 3 do |row|
          if !row[0].nil? 
            create_or_find_region(row)
            create_or_find_province(row)
            create_or_find_assessor(row)
            create_or_find_assessorship(row)
            create_or_find_barangay(row)
            create_or_find_municipality_or_city(row)
            create_or_find_by_client_province(row)
            create_or_find_by_client_province(row)
            create_or_find_client_address(row)
            create_or_find_educational_attainment(row)
            create_or_find_education(row)
            create_or_find_company(row)
            create_or_find_assessor_employment(row)
            create_or_find_sector(row)
            create_or_find_qualification(row)
            create_or_find_assessor_accreditation(row)
          end 
        end 
      end 
    end
    def create_or_find_region(row)
      Addresses::Region.find_or_create_by(name: row[0])
    end
    def create_or_find_province(row)
      Addresses::Province.find_or_create_by(name: row[1], region: create_or_find_region(row))
    end
    def create_or_find_assessor(row)
      assessor_full_name = row[2]
      assessor_last_name = assessor_full_name.split.first.gsub(",", "")
      assessor_middle_name = assessor_full_name.split.last
      assessor_first_name = assessor_full_name.gsub(assessor_full_name.split.last, "").gsub(assessor_full_name.split.first, "").strip
      Client.find_or_create_by(first_name: assessor_first_name, middle_name: assessor_middle_name, last_name: assessor_last_name, sex: row[4].downcase, date_of_birth: row[5])
    end 
    def create_or_find_assessorship(row)
      Clients::Assessor.find_or_create_by(client: create_or_find_assessor(row))
    end
    def create_or_find_barangay(row)
      Addresses::Barangay.find_or_create_by(name: row[3].split(",").second.strip)
    end
    def create_or_find_municipality_or_city(row)
      Addresses::MunicipalityOrCity.find_or_create_by(name: row[3].split(",").second.strip)
    end
    def create_or_find_by_client_province(row)
      Addresses::Province.find_or_create_by(name: row[9].split(",").last.strip)
    end
    def create_or_find_client_address(row)
      Address.find_or_create_by(addressable: create_or_find_assessor(row), barangay: create_or_find_barangay(row), municipality_or_city: create_or_find_municipality_or_city(row), province: create_or_find_by_client_province(row))
    end
    def create_or_find_educational_attainment(row)
      Configurations::EducationalAttainment.find_or_create_by(name: row[6])
    end
    def create_or_find_education(row)
      Clients::Education.find_or_create_by(educational_attainment: create_or_find_educational_attainment(row), client: create_or_find_assessor(row))
    end
    def create_or_find_company(row)
      Company.find_or_create_by(name: row[8])
    end
    def create_or_find_assessor_employment(row)
      Clients::Employment.find_or_create_by(assessor: create_or_find_assessorship(row), designation: row[7], company: create_or_find_company(row))
    end
    def create_or_find_sector(row)
      Sector.find_or_create_by(name: row[9])
    end
    def create_or_find_qualification(row)
      Qualification.find_or_create_by(name: row[10], sector: create_or_find_sector(row))
    end
    def create_or_find_assessor_accreditation(row)
      Accreditation.find_or_create_by(accredited: create_or_find_assessorship(row), number: row[11], qualification: create_or_find_qualification(row), accreditation_date: row[12], expiry_date: row[13])
    end
  end 
end 