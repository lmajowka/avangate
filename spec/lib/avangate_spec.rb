require 'spec_helper'

module Avangate

  describe SOAP do

    it 'should login' do
      Avangate::SOAP.login
    end

  end

end