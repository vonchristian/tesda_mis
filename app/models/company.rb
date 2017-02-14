class Company < ApplicationRecord
  has_many :employees, class_name: "Clients::Employment", foreign_key: "company_id", source: :client
end
