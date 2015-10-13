module Avangate
  class AvangateError < StandardError
    attr_accessor :data

    def initialize(data)
      self.data = data
      super
    end
  end

  class MissingSecretKey < AvangateError; end
  class MissingMerchantCode < AvangateError; end

end