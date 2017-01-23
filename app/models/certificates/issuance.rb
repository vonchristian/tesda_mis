module Certificates
  class Issuance < ApplicationRecord
    belongs_to :certificate, class_name: "Trainees::Certificate"

    validates :serial_number, presence: true, uniqueness: true
  end
end
