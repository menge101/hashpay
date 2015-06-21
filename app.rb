require 'sinatra'
require 'stripe'
require 'active_record'
require 'sinatra/activerecord'
require 'rack-flash'
require 'sinatra/redirect_with_flash'
require 'json'
require_relative 'models/attendees'

enable :sessions
use Rack::Flash

EVENT_NAME = 'P3H3 Inaug'
EVENT_COST = 5.00

class HashPayApp < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  helpers Sinatra::RedirectWithFlash

  Stripe.api_key = ENV['STRIPE_PRIVATE_KEY']

  get '/' do
    @public_key = ENV['STRIPE_PUBLIC_KEY']
    @amount = EVENT_COST
    @description = "#{EVENT_NAME} payment"
    erb :index
  end

  post '/charge' do
    current_attendee = Attendee.create do |a|
      a.name = params[:name]
      a.hash_name = params[:hash_name]
      a.home_kennel = params[:kennel]
      a.email = params[:stripeEmail]
      a.stripe_token = params[:stripeToken]
      a.pay_status = false
    end

    puts params

    puts current_attendee
    puts current_attendee.valid?

    erb :charge
  end
end




