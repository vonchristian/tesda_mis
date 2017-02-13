module Clients  
  class Employment < ApplicationRecord
    belongs_to :company
    belongs_to :assessor, class_name: "Clients::Assessor"
    validates :designation, presence: true 
    validates :company_id, presence: true
  end
end