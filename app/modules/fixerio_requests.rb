module FixerioRequests
  BASE_URL = 'http://data.fixer.io/api/latest'

  class << self
    def client
      client = Faraday.new(BASE_URL)
      client.params['access_key'] = ENV['FIXERIO_KEY']

      client
    end

    def get_eur_conversion_rates
      response = client.get
      response_to_hash(response)
    end

    private

    def json_string_to_hash(string)
      JSON.parse(string.empty? ? '{}' : string)
    end

    def response_to_hash(response)
      {
        status: response.status,
        body: json_string_to_hash(response.body)
      }
    end
  end
end