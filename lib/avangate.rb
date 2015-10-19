require "savon"
require "avangate/version"
require "avangate/base"
require "avangate/errors"

module Avangate

  END_POINT = 'https://api.avangate.com/order/2.3/soap/?wsdl'
  STATE_REQUIRED_COUNTRIES = ['US','RO','BR']

  class SOAP
    def self.login
      begin
        response = client.call :login, message: login_params
        return response.body[:login_response][:login_return]
      rescue Savon::SOAPFault => e
        return false
      end
    end

    def self.add_product(options={})
      @options = options
      require_session_id
      require_product_id
      response = client.call :add_product, message: add_product_params
      return response.body[:add_product_response][:add_product_return]
    end

    def self.set_billing_details(options={})
      @options = options
      require_session_id
      require_set_billing_details_params
      response = client.call :set_billing_details, message: set_billing_details_params
      return response.body[:set_billing_details_response][:set_billing_details_return]
    end

    def self.get_product_by_code(options={})
      @options = options
      require_session_id
      require_product_code
      response = client.call :get_product_by_code, message: get_product_by_code_params
      return response.body[:get_product_by_code_response][:get_product_by_code_return]
    end

    private

    def self.require_session_id
      raise MissingSessionId, "missing param session_id" unless @options[:session_id]
    end

    def self.require_product_id
      raise MissingProductId, "missing param product_id" unless @options[:product_id]
    end

    def self.require_product_code
      raise MissingProductCode, "missing param product_code" unless @options[:product_code]
    end

    def self.require_set_billing_details_params
      raise MissingAddress, "missing param address" unless @options[:address]
      raise MissingCity, "missing param city" unless @options[:city]
      raise MissingCountry, "missing param country" unless @options[:country]
      raise MissingEmail, "missing param email" unless @options[:email]
      raise MissingFirstName, "missing param first_name" unless @options[:first_name]
      raise MissingLastName, "missing param last_name" unless @options[:last_name]
      raise MissingPostalCode, "missing param postal_code" unless @options[:postal_code]
      raise MissingState, "missing param state" unless @options[:state] or !STATE_REQUIRED_COUNTRIES.include? @options[:country]
    end

    def self.billing_details
      billing_details = {}
      billing_details['Address'] = @options[:address]
      billing_details['City'] =  @options[:city]
      billing_details['Country'] =  @options[:country]
      billing_details['Email'] =  @options[:email]
      billing_details['FirstName'] =  @options[:first_name]
      billing_details['LastName'] =  @options[:last_name]
      billing_details['PostalCode'] =  @options[:postal_code]
      billing_details['State'] =  @options[:state]
      billing_details
    end

    def self.client
      @client ||= Savon.client(wsdl: END_POINT)
    end

    def self.login_params
      {
          MerchantCode: merchant_code,
          Date: now,
          hash: hash
      }
    end

    def self.add_product_params
      quantity = @options[:quantity] ? @options[:quantity] : 1
      {
        sessionID: @options[:session_id],
        ProductId: @options[:product_id],
        Quantity: quantity
      }
    end

    def self.set_billing_details_params
      {
          sessionID: @options[:session_id],
          BillingDetails: billing_details
      }
    end

    def self.get_product_by_code_params
      {
        sessionID: @options[:session_id],
        ProductCode: @options[:product_code]
      }
    end

    def self.merchant_code
      Avangate::Base.merchant_code
    end

    def self.now
      Time.now.utc.strftime "%Y-%m-%d %H:%M:%S"
    end

    def self.secret_key
      Avangate::Base.secret_key
    end

    def self.data_for_hash
      merchant_code.size.to_s + merchant_code + now.size.to_s + now.to_s
    end

    def self.hash
      OpenSSL::HMAC.hexdigest  OpenSSL::Digest.new('md5'), secret_key, data_for_hash
    end

  end
end
