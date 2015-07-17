class HashKennelsController < ApplicationController
  def view
    @hash_kennel = HashKennel.find_by! abbreviation: params[:abbrev]
  end
end