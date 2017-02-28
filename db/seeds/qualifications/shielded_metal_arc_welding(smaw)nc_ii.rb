qualification = Qualification.find_or_create_by(name: "Shielded Metal Arc Welding (SMAW) NC II")

qualification.competencies.basic.find_or_create_by(unit_code: "500311105", unit_title: "Participate in workplace communication")
qualification.competencies.basic.find_or_create_by(unit_code: "500311106", unit_title: "Work in team environment")
qualification.competencies.basic.find_or_create_by(unit_code: "500311107", unit_title: "Practice career professionalism")
qualification.competencies.basic.find_or_create_by(unit_code: "500311108", unit_title: "Practice occupational health and safety procedures")

qualification.competencies.common.find_or_create_by(unit_code: "MEE722201", unit_title: "Apply safety practices")
qualification.competencies.common.find_or_create_by(unit_code: "MEE721202", unit_title: "Interpret drawings and sketches")
qualification.competencies.common.find_or_create_by(unit_code: "MEE721203", unit_title: "Perform industry calculations")
qualification.competencies.common.find_or_create_by(unit_code: "MEE721204", unit_title: "Contribute to quality system")
qualification.competencies.common.find_or_create_by(unit_code: "MEE721205", unit_title: "Use hand tools")
qualification.competencies.common.find_or_create_by(unit_code: "MEE721206", unit_title: "Prepare weld materials")
qualification.competencies.common.find_or_create_by(unit_code: "MEE721207", unit_title: "Setup welding equipment")
qualification.competencies.common.find_or_create_by(unit_code: "MEE721208", unit_title: "Fit up Weld Materials")
qualification.competencies.common.find_or_create_by(unit_code: "MEE721209", unit_title: "Repair welds")

qualification.competencies.core.find_or_create_by(unit_code: "MEE721306", unit_title: "Weld carbon steel plates and pipes using SMAW")
