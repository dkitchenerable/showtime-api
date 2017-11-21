class ApiClient
  ApiError = Class.new(StandardError)

  def initialize(options)
    @key = options[:api_key]
    @base_url = options[:base_url]
  end

  def get(endpoint, params)
    @api_response = HTTParty.get(
      base_url + endpoint,
      query: params.merge!(api_key: key),
      format: :json
    )

    if valid_response?
      return @api_response
    else
      raise ApiError.new(@api_response.message)
    end
  end

  def post
    @api_response = HTTParty.post(
      base_url + endpoint,
      body: params.merge(key: key).to_json,
      format: :json
    )
  end

  private

  attr_reader :key, :base_url, :api_response

  def valid_response?
    api_response && valid_code?
  end

  def valid_code?
    api_response.response.code.to_i.between?(200,299)
  end
end
