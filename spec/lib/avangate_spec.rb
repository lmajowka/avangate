require 'spec_helper'

module Avangate

  describe SOAP do

    it 'should return now in the correct format' do
      Avangate::SOAP.send(:now).should match /[0-9]+{4}-[0-9]+{2}-[0-9]+{2}\s[0-9]+{2}:[0-9]+{2}:[0-9]+{2}/
    end

  end

end