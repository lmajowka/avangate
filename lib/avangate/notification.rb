module Avangate

  class Notification

    def initialize(params)
      @ipn_pid0 = params[:IPN_PID].first
      @ipn_pname0 = params[:IPN_PNAME].first
      @date = params[:IPN_DATE]
    end

    def generate_receipt
      "<EPAYMENT>#{@date}|#{hash}</EPAYMENT>"
    end

    private


    def hash
      OpenSSL::HMAC.hexdigest  OpenSSL::Digest.new('md5'), secret_key, data_for_hash
    end

    def data_for_hash
      values = [@ipn_pid0, @ipn_pname0, @date, @date]
      str = ""
      values.each do |value|
        str << value.size.to_s + value.to_s
      end
      str
    end

    def secret_key
      Avangate::Base.secret_key
    end

  end

end