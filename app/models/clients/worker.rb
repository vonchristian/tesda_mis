module Clients
  class Worker < ApplicationRecord
    belongs_to :client
  end
end