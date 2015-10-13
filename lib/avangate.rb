require "savon"
require "avangate/version"
require "avangate/base"
require "avangate/errors"

module Avangate

  END_POINT = 'https://api.avangate.com/order/2.3/soap/?wsdl'

  class SOAP
    def self.login
      begin
        response = client.call :login, message: login_params
        return response.body.first[1].first[1]
      rescue Savon::SOAPFault => e
        return false
      end
    end

    private

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
