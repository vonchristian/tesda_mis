module Clients
  class Worker < ApplicationRecord
    belongs_to :client

    include PgSearch
    extend FriendlyId
    friendly_id :full_name, use: :slugged
    # multisearchable :against => [:last_name]
    pg_search_scope :text_search, :against => [:last_name, :first_name]

    delegate :full_name, :last_name, :first_name, to: :client, allow_nil: true
    delegate :avatar, :current_address, :contact_number, to: :client
    delegate :educations, to: :client
    delegate :certifications, to: :client
  end
end