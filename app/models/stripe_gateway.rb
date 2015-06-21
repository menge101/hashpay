class StripeGateway
  def self.charge(source, amount, charge_description)
    begin
      charge = Stripe::Charge.create(
                     amount: amount, #amount must be in cents!
                     currency: 'usd',
                     source: source,
                     description: charge_description
                 )
      { success: 'Payment was made', response: charge }
    rescue Stripe::CardError => e
      puts e.message
      { error: 'Unable to process the provided card.' }
      #redirect_to :back, flash: { error: 'Unable to process the provided card.' }
      #false
    rescue => e
      puts e.message
      { error: e.message }
      ##redirect_to :back, flash: {error: 'System unavailable, please try again later.' }
      #false
    end
  end
end