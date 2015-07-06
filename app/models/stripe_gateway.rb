class StripeGateway
  def self.charge(source, amount, charge_description)
    begin
      charge = Stripe::Charge.create(
                     amount: amount.to_i, #amount must be in cents and an integer apparently
                     currency: 'usd',
                     source: source,
                     description: charge_description
                 )
      { success: true, response: charge }
    rescue Stripe::CardError => e
      puts e.message
      { error: 'Unable to process the provided card.' }
    rescue => e
      puts e.message
      { error: e.message }
    end
  end
end