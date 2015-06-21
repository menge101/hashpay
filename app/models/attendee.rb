class Attendee < ActiveRecord::Base
  validates :name, presence: true
  validates :home_kennel, presence: true
  validates :pay_status, presence: true
  validates :stripe_token, presence: true
  validates :email, uniqueness: { scope: :name, case_sensitive: false }
  validates :hash_name, uniqueness: { scope: :home_kennel, case_sensitive: false }

  def pay(amount, event_name)
    puts "####################################################################"
    puts "STRIPE TOKEN: #{@stripe_token}"
    x = StripeGateway.charge(@stripe_token, amount, "#{amount} paid for #{event_name} registration" )
    puts x.class

    if x.has_key?('success')
      @pay_status = true
      @stripe_token = 'used'
    end
    x
  end
end