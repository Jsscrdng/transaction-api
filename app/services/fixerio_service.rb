class FixerioService
  def eur_to_usd_rate
    response = FixerioRequests.get_eur_conversion_rates
    response[:body]['rates'].try(:[], 'USD')
  end

  def usd_to_eur_rate
    response = FixerioRequests.get_eur_conversion_rates
    1/(response[:body]['rates'].try(:[], 'USD'))
  end
end