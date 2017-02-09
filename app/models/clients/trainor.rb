module Clients
  class Trainor < ApplicationRecord
    include PgSearch
    # multisearchable :against => [:last_name]
    pg_search_scope :text_search, :against => [:last_name, :first_name]
    
    belongs_to :client
    has_one :accreditation, as: :accredited
    has_many :conducted_trainings, class_name: "Training"

     delegate :full_name, :last_name, :first_name, to: :client
  end
end
