class PartiesController < ApplicationController
  def index
    @parties = Party.nonexpired_parties
    @old_parties = Party.old_parties
  end

  def show
    @party = Party.find(params[:id])
    @host = @party.host
  end
end
