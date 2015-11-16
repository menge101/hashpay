class HashKennelsController < ApplicationController
  def view
    @hash_kennel = HashKennel.find_by! id: params[:id]
  end
end