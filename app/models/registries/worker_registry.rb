module Registries 
  class WorkerRegistry < Registry 
    after_commit :parse_for_records
    
    private
    def parse_for_records
      book = Spreadsheet.open(spreadsheet.path)
      sheet = book.worksheet(0)
      transaction do
        sheet.each 1 do |row|
          if !row[0].nil? 
            create_or_find_training_institution(row)
            create_or_find_training_center_accreditation(row)
            create_or_find_training_center(row)
            create_or_find_client(row)
            create_or_find_worker(row)
            create_or_find_education(row)
            create_or_find_training(row)
            create_or_find_worker_address(row)
            create_or_find_completed_training(row)
            create_or_find_assessor(row)
            create_or_find_assessor_accreditation(row)
            create_or_find_assessment_institution(row)
            create_or_find_assessment_center(row)
            create_or_find_assessment_center_accreditation(row)
            create_or_find_worker_assessment(row)
            create_or_find_certification(row)
          end
        end
      end
    end
    def create_or_find_region(row)
      Addresses::Region.find_or_create_by(name: row[0])
    end
    def create_or_find_province(row)
      Addresses::Province.find_or_create_by(name: row[1].downcase.capitalize)
    end
    def create_or_find_sector(row)
      Sector.find_or_create_by(name: row[21])
    end
    def create_or_find_qualification(row)
      Qualification.find_or_create_by(name: row[23])
    end
    def find_qualification(row)
      Qualification.where(name: row[23]).first 
    end
    def create_or_find_modality(row)
      Modality.find_or_create_by(name: row[7])
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
    def date_of_birth(row)
      date_of_birth = row[6]
      if date_of_birth.instance_of?(DateTime)
        date_of_birth
      elsif date_of_birth.instance_of?(String)
        date_of_birth =  Date.strptime(row[6], "%m/%d/%Y")
      end 
      date_of_birth
    end

    def create_or_find_client(row)
      first_name = row[4].try(:downcase).try(:capitalize)
      middle_name = row[5].try(:downcase).try(:capitalize)
      last_name =  row[3].try(:downcase).try(:capitalize)
      full_name = first_name + " " + middle_name + " " + last_name
      client = Client.find_or_create_by(last_name: last_name, first_name: first_name, middle_name: middle_name, date_of_birth: date_of_birth(row), contact_number: row[10], sex: row[11].try(:strip).try(:downcase), full_name: full_name)
    end
    def find_client(row)
      first_name = row[4].try(:downcase).try(:capitalize)
      middle_name = row[5].try(:downcase).try(:capitalize)
      last_name =  row[3].try(:downcase).try(:capitalize)
      # full_name = first_name + " " + middle_name + ". " + last_name
      Client.where(last_name: last_name, first_name: first_name, middle_name: middle_name).first
    end
    def create_or_find_worker(row)
      Clients::Worker.find_or_create_by(client: find_client(row))
    end
    def create_or_find_educational_attainment(row)
      Configurations::EducationalAttainment.find_or_create_by(name: row[12])
    end
    def create_or_find_education(row)
      Clients::Education.find_or_create_by(educational_attainment: create_or_find_educational_attainment(row), client: find_client(row))
    end
    def create_or_find_competency(row)
      Qualifications::Competency.find_or_create_by(qualification: create_or_find_qualification(row), name: row[24].try(:downcase).try(:capitalize), unit_title: row[24].try(:downcase).try(:capitalize))
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

    def create_or_find_worker_address(row)
     Address.parse_address(row[9], find_client(row))
    end

    def create_or_find_completed_training(row)
      Clients::CompletedTraining.find_or_create_by(region: create_or_find_region(row), province: create_or_find_province(row), reference_number: row[2], client: find_client(row), modality: create_or_find_modality(row), client_type: create_or_find_worker_type(row), training: create_or_find_training(row), registry: self)
    end

    def create_or_find_assessor(row)
      client = Client.parse_for_client(row[19])
      Clients::Assessor.find_or_create_by(client: client)
    end

    def find_assessorship(row)
      Clients::Assessor.where(client: find_client(row)).first
    end

    def create_or_find_assessor_accreditation(row)
      Accreditation.create(accredited: find_assessorship(row), qualification: create_or_find_qualification(row), number: row[20])
    end

    def create_or_find_assessment_institution(row)
      Institution.find_or_create_by(name: row[18])
    end

    def create_or_find_assessment_center(row)
      Institutions::AssessmentCenter.find_or_create_by(institution: create_or_find_assessment_institution(row))
    end

    def create_or_find_assessment_center_accreditation(row)
      Accreditation.find_or_create_by(accredited: create_or_find_assessment_center(row), qualification: create_or_find_qualification(row))
    end

    def result(row)
      row[25].strip.downcase.parameterize.gsub("-", "_")
    end

    def create_or_find_worker_assessment(row)
      Assessment.find_or_create_by(assessee: create_or_find_completed_training(row), assessor: find_assessorship(row), assessment_center: create_or_find_assessment_center(row), result: result(row), application_date: row[16], assessment_date: row[17])
    end

    def level(row)
      row[23].try(:split).try(:last)
    end

    def create_or_find_certification_level(row)
      Configurations::CertificationLevel.find_or_create_by(level: level(row))
    end


    def type(row)
      cert_type = row[22].try(:strip).try(:upcase)
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
          create_or_find_national_certification(row)
        elsif type(row) == "Certifications::CertificateOfCompetency"
          create_or_find_competency_certification(row)
        end
      end
    end
    def create_or_find_national_certification(row)
      Certifications::NationalCertificate.find_or_create_by(client: find_client(row), certified: create_or_find_worker_assessment(row), qualification: create_or_find_qualification(row), issue_date: issue_date(row), expiry_date: expiry_date(row), assessment_date: assessment_date(row), number: row[26].to_i, certification_level: create_or_find_certification_level(row), registry: self)
    end

    def create_or_find_competency_certification(row)
      Certifications::CertificateOfCompetency.find_or_create_by(client: find_client(row), certified: create_or_find_worker_assessment(row), competency: create_or_find_competency(row), issue_date: issue_date(row), expiry_date: expiry_date(row), assessment_date: assessment_date(row), number: row[26].to_i, registry: self)
    end
    def issue_date(row)
      issue_date = row[27]
      if issue_date.instance_of?(DateTime)
        issue_date
      elsif issue_date.instance_of?(String)
        issue_date = Date.strptime(row[27], "%m/%d/%Y")
      end
      issue_date
    end
    def expiry_date(row)
      expiry_date = row[28]
      if expiry_date.instance_of?(DateTime)
        expiry_date
      elsif expiry_date.instance_of?(String)
        expiry_date = Date.strptime(row[28], "%m/%d/%Y")
      end
      expiry_date
    end  
    def assessment_date(row)
      assessment_date = row[17]
      if assessment_date.instance_of?(DateTime)
        assessment_date
      elsif assessment_date.instance_of?(String)
        assessment_date = Date.strptime(row[28], "%m/%d/%Y")
      end
      assessment_date
    end  
  end
end