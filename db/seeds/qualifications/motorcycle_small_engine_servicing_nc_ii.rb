
qualification = Qualification.find_or_create_by(name: "Motorcycle/Small Engine Servicing NC II")

Qualifications::Competency.find_or_create_by(competency_type: 0, unit_code: '500311105', unit_title: "Participate in Workplace Communication", qualification: qualification)
Qualifications::Competency.find_or_create_by(competency_type: 0, unit_code: '500311106', unit_title: "Work in a Team Environment", qualification: qualification)
Qualifications::Competency.find_or_create_by(competency_type: 0, unit_code: '500311107', unit_title: "Practice Career Professionalism", qualification: qualification)
Qualifications::Competency.find_or_create_by(competency_type: 0, unit_code: '500311108', unit_title: "Practice Occupational Health and Safety Procedures", qualification: qualification)

Qualifications::Competency.find_or_create_by(competency_type: 1, unit_code: 'ALT723201', unit_title: "Apply Appropriate Sealant/Adhesive", qualification: qualification)
Qualifications::Competency.find_or_create_by(competency_type: 1, unit_code: 'ALT723202', unit_title: "Move and Position Vehicle", qualification: qualification)
Qualifications::Competency.find_or_create_by(competency_type: 1, unit_code: 'ALT311202', unit_title: "Perform Mensuration and Calculation", qualification: qualification)
Qualifications::Competency.find_or_create_by(competency_type: 1, unit_code: 'ALT723203', unit_title: "Read, Interpret and Apply Specifications and Manuals", qualification: qualification)
Qualifications::Competency.find_or_create_by(competency_type: 1, unit_code: 'ALT723204', unit_title: "Use and Apply Lubricants/Coolants", qualification: qualification)
Qualifications::Competency.find_or_create_by(competency_type: 1, unit_code: 'ALT723205', unit_title: "Perform Shop Maintenance", qualification: qualification)
Qualifications::Competency.find_or_create_by(competency_type: 1, unit_code: 'ALT311211', unit_title: "Prepare Job Estimate/Costing", qualification: qualification)
Qualifications::Competency.find_or_create_by(competency_type: 1, unit_code: 'ALT311212', unit_title: "Observe Quality Systems", qualification: qualification)
Qualifications::Competency.find_or_create_by(competency_type: 1, unit_code: 'ALT723213', unit_title: "Perform Periodic Maintenance", qualification: qualification)

Qualifications::Competency.find_or_create_by(competency_type: 2, unit_code: 'ALT723372', unit_title: "Service Motorcycle/Small Engine System", qualification: qualification)
Qualifications::Competency.find_or_create_by(competency_type: 2, unit_code: 'ALT723373', unit_title: "Service Electrical System", qualification: qualification)
Qualifications::Competency.find_or_create_by(competency_type: 2, unit_code: 'ALT723374', unit_title: "Service Chassis", qualification: qualification)
Qualifications::Competency.find_or_create_by(competency_type: 2, unit_code: 'ALT723375', unit_title: "Overhaul Motorcycle/Small Engine", qualification: qualification)
