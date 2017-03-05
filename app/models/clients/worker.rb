module Clients
  class Worker < ApplicationRecord
    include PgSearch
    extend FriendlyId
    friendly_id :full_name, use: :slugged
    # multisearchable :against => [:last_name]
    pg_search_scope :text_search, :against => [:last_name, :first_name]
    belongs_to :client

    delegate :full_name, :last_and_first_name, :first_and_last_name, :name_with_middle_initial, :last_name, :first_name, :date_of_birth,
             :avatar, :current_address, :contact_number,
             :educations, :certifications, 
             :national_certificates, :certificate_of_competencies, 
             to: :client, allow_nil: true
  end
end