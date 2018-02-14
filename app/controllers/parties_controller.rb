class PartiesController < ApplicationController
  def index
    @parties = Party.nonexpired_parties
    @old_parties = Party.old_parties
  end

  def show
    @party = Party.find(params[:id])
    @host = @party.host
    @dishes = @party.dishes
    @foods = @party.foods
    @desserts = @dishes.desserts
    @entrees = @dishes.entrees
    @apps = @dishes.apps
  end
end
