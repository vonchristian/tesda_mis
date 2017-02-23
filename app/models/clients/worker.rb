module Clients
  class Worker < ApplicationRecord
    include PgSearch
    extend FriendlyId
    friendly_id :full_name, use: :slugged
    # multisearchable :against => [:last_name]
    pg_search_scope :text_search, :against => [:last_name, :first_name]
    belongs_to :client

    delegate :full_name, :last_name, :first_name, 
             :avatar, :current_address, :contact_number,
             :educations, :certifications, 
             :national_certificates, :certificate_of_competencies, 
             to: :client, allow_nil: true
  end
end