qualification = Qualification.find_or_create_by(name: "Beauty Care Services(Nail Care) NC II")

qualification.competencies.basic.find_or_create_by(unit_code: "500311105", unit_title: "Participate in workplace communication")
qualification.competencies.basic.find_or_create_by(unit_code: "500311106", unit_title: "Work in team environment")
qualification.competencies.basic.find_or_create_by(unit_code: "500311107", unit_title: "Practice career professionalism")
qualification.competencies.basic.find_or_create_by(unit_code: "500311108", unit_title: "Practice occupational health and safety procedures")

qualification.competencies.common.find_or_create_by(unit_code: "HCS515201", unit_title: "Maintain an effective relationship with clients/customers")
qualification.competencies.common.find_or_create_by(unit_code: "HCS515202", unit_title: "Manage own performance")
qualification.competencies.common.find_or_create_by(unit_code: "HCS515204", unit_title: "Apply quality standards")
qualification.competencies.common.find_or_create_by(unit_code: "HCS515205", unit_title: "Maintain a safe, clean and efficient environment")

qualification.competencies.core.find_or_create_by(unit_code: "HCS515325", unit_title: "Perform manicure and pedicure")
qualification.competencies.core.find_or_create_by(unit_code: "HCS515326", unit_title: "Perform hand spa")
qualification.competencies.core.find_or_create_by(unit_code: "HCS515330", unit_title: "Perform foot spa")