module Registries 
  class WorkerRegistry < Registry 

    def parse_for_records
      book = Spreadsheet.open(self.spreadsheet.path)
      sheet = book.worksheet(0)
      transaction do
        sheet.each 1 do |row|
          if !row[0].nil?
            create_or_find_region(row)
            create_or_find_province(row)
            create_or_find_sector(row)
            create_or_find_qualification(row)
            create_or_find_training_institution(row)
            create_or_find_training_center_accreditation(row)
            create_or_find_training_center(row)
            create_or_find_client(row)
            create_or_find_worker(row)
            create_or_find_educational_attainment(row)
            create_or_find_education(row)
            create_or_find_competency(row)
            create_or_find_worker_type(row)
            create_or_find_modality(row)
            create_or_find_training(row)
            create_or_find_barangay(row)
            create_or_find_municipality_or_city(row)
            create_or_find_by_worker_province(row)
            create_or_find_worker_address(row)
            create_or_find_completed_training(row)
            create_or_find_assessor(row)
            create_or_find_assessorship(row)
            create_or_find_assessor_accreditation(row)
            create_or_find_assessment_institution(row)
            create_or_find_assessment_center(row)
            create_or_find_assessment_center_accreditation(row)
            create_or_find_worker_assessment(row)
            create_or_find_certification_level(row)
            create_or_find_certification(row)
          end
        end
      end
    end

    private
    def create_or_find_region(row)
      Addresses::Region.find_or_create_by(name: row[0])
    end
    def create_or_find_province(row)
      Addresses::Province.find_or_create_by(name: row[1])
    end
    def create_or_find_sector(row)
      Sector.find_or_create_by(name: row[19])
    end
    def create_or_find_qualification(row)
      Qualification.find_or_create_by(name: row[21], sector: create_or_find_sector(row))
    end
    def create_or_find_training_institution(row)
      Institution.find_or_create_by(name: row[14])
    end
    def create_or_find_training_center_accreditation(row)
      Accreditation.find_or_create_by(accredited: create_or_find_training_institution(row), qualification: create_or_find_qualification(row))
    end
    def create_or_find_training_center(row)
      Institutions::TrainingCenter.find_or_create_by(institution: create_or_find_training_institution(row))
    end

    def create_or_find_client(row)
      Client.find_or_create_by(last_name: row[3], first_name: row[4], middle_name: row[5], date_of_birth: row[6], contact_number: row[10], sex: row[11].strip.downcase)
    end
    def create_or_find_worker(row)
      Clients::Worker.find_or_create_by(client: create_or_find_client(row))
    end
    def create_or_find_educational_attainment(row)
      Configurations::EducationalAttainment.find_or_create_by(name: row[12])
    end
    def create_or_find_education(row)
      Clients::Education.find_or_create_by(educational_attainment: create_or_find_educational_attainment(row), client: create_or_find_client(row))
    end
    def create_or_find_competency(row)
      Qualifications::Competency.find_or_create_by(qualification: create_or_find_qualification(row), unit_title: row[22])
    end
    def create_or_find_worker_type(row)
      Configurations::ClientType.find_or_create_by(name: row[8])
    end
    def create_or_find_modality(row)
      Configurations::Modality.find_or_create_by(name: row[7])
    end
    def create_or_find_training(row)
      Training.find_or_create_by(name: row[13], qualification: create_or_find_qualification(row), training_center_id: create_or_find_training_center(row).id)
    end
    def create_or_find_barangay(row)
      Addresses::Barangay.find_or_create_by(name: row[9].split(",").first.strip)
    end
    def create_or_find_municipality_or_city(row)
      Addresses::MunicipalityOrCity.find_or_create_by(name: row[9].split(",").second.strip)
    end
    def create_or_find_by_worker_province(row)
      Addresses::Province.find_or_create_by(name: row[9].split(",").last.strip)
    end

    def create_or_find_worker_address(row)
      Address.find_or_create_by(addressable: create_or_find_client(row), street: row[9].split(",").first.strip, barangay: create_or_find_barangay(row), municipality_or_city: create_or_find_municipality_or_city(row), province: create_or_find_by_worker_province(row))
    end

    def create_or_find_completed_training(row)
      Clients::CompletedTraining.find_or_create_by(region: create_or_find_region(row), province: create_or_find_province(row), reference_number: row[2], client: create_or_find_client(row), modality: create_or_find_modality(row), client_type: create_or_find_worker_type(row), training: create_or_find_training(row), registry: self)
    end

    def create_or_find_assessor(row)
      assessor_full_name = row[17]
      assessor_last_name = assessor_full_name.split.first.gsub(",", "")
      assessor_middle_name = assessor_full_name.split.last
      assessor_first_name = assessor_full_name.gsub(assessor_full_name.split.last, "").gsub(assessor_full_name.split.first, "").strip
      Client.find_or_create_by(first_name: assessor_first_name, middle_name: assessor_middle_name, last_name: assessor_last_name)
    end

    def create_or_find_assessorship(row)
      Clients::Assessor.find_or_create_by(client: create_or_find_assessor(row))
    end

    def create_or_find_assessor_accreditation(row)
      Accreditation.find_or_create_by(accredited: create_or_find_assessorship(row), qualification: create_or_find_qualification(row), number: row[18].to_i)
    end

    def create_or_find_assessment_institution(row)
      Institution.find_or_create_by(name: row[16])
    end

    def create_or_find_assessment_center(row)
      Institutions::AssessmentCenter.find_or_create_by(institution: create_or_find_assessment_institution(row))
    end

    def create_or_find_assessment_center_accreditation(row)
      Accreditation.find_or_create_by(accredited: create_or_find_assessment_center(row), qualification: create_or_find_qualification(row))
    end

    def result(row)
      row[23].downcase.parameterize.gsub("-", "_")
    end

    def create_or_find_worker_assessment(row)
      Assessment.find_or_create_by(assessee: create_or_find_completed_training(row), assessor: create_or_find_assessorship(row), assessment_center: create_or_find_assessment_center(row), result: result(row))
    end

    def level(row)
      row[21].split.last 
    end

    def create_or_find_certification_level(row)
      Configurations::CertificationLevel.find_or_create_by(level: level(row))
    end


    def type(row)
      cert_type = row[20]
      if cert_type == "NC" 
        type = "Certifications::NationalCertificate"
      elsif cert_type == "COC"
        type = "Certifications::CertificateOfCompetency"
      end
      type  
    end

    def create_or_find_certification(row)
      if result(row) == "competent" 
        if type(row) == "Certifications::NationalCertificate"
          Certifications::NationalCertificate.find_or_create_by!(client: create_or_find_client(row), certified: create_or_find_worker_assessment(row), qualification_id: create_or_find_qualification(row).id, issue_date: row[25], expiry_date: row[26], number: row[24].to_i, certification_level: create_or_find_certification_level(row))
        elsif type(row) == "Certifications::CertificateOfCompetency"
          create_or_find_competency_certification(row)
        end
      end
    end

    def create_or_find_competency_certification(row)
      Certifications::CertificateOfCompetency.find_or_create_by(client: create_or_find_client(row), certified: create_or_find_worker_assessment(row), competency_id: create_or_find_competency(row).id, issue_date: row[25], expiry_date: row[26], number: row[24].to_i)
    end
  end
end