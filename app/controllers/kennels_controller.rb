class KennelsController < ApplicationController
  def view
    @kennel = Kennel.find_by! id: params[:id]
  end
end