module Avangate
    class Base
      class << self

        def merchant_code=(code)
          @@merchant_code = code
        end

        def secret_key=(key)
          @@secret_key = key
        end

        def merchant_code
          begin
            @@merchant_code
          rescue NameError
            raise MissingMerchantCode, "No merchant_code has been set!"
          end
        end

        def secret_key
          begin
            @@secret_key
          rescue NameError
            raise MissingSecretKey, "No secret_key has been set!"
          end
        end

      end
    end
end