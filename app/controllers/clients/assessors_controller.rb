module Clients
  class AssessorsController < ApplicationController
    def index
      if params[:search].present?
        @assessors = Client.text_search(params[:search])
      else
        @assessors = Clients::Assessor.all
      end
    end
    def show
      @assessor = Client.find(params[:id])
    end
  end
end
