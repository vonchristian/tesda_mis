module Clients
  class CompletedTraining < ApplicationRecord
    belongs_to :client, class_name: "Client", foreign_key: 'client_id'
    belongs_to :training
    belongs_to :region, class_name: "Addresses::Region"
    belongs_to :province, class_name: "Addresses::Province"
    belongs_to :modality, class_name: "Configurations::Modality"
    belongs_to :client_type, class_name: "Configurations::ClientType"
    belongs_to :registry

    delegate :full_name, to: :client
    delegate :qualification, to: :training
    delegate :competency, to: :training

    def name 
      training.name 
    end
  end
end
