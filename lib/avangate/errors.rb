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
  class MissingSessionId < AvangateError; end
  class MissingProductId < AvangateError; end
  class MissingAddress < AvangateError; end
  class MissingCity < AvangateError; end
  class MissingCountry < AvangateError; end
  class MissingEmail < AvangateError; end
  class MissingFirstName < AvangateError; end
  class MissingLastName < AvangateError; end
  class MissingPostalCode < AvangateError; end
  class MissingState < AvangateError; end
end