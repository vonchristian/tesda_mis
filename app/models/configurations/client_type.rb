module Configurations
  class ClientType < ApplicationRecord
    validates :name, presence: true, uniqueness: true
  end
end
