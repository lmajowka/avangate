require 'spec_helper'

module Avangate

  describe SOAP do

    it 'should return now in the correct format' do
      expect(Avangate::SOAP.send(:now)).to match /[0-9]+{4}-[0-9]+{2}-[0-9]+{2}\s[0-9]+{2}:[0-9]+{2}:[0-9]+{2}/
    end

    describe '#add_product' do

      it 'should require session and product id' do
        expect { Avangate::SOAP.add_product }.to raise_error MissingSessionId
        expect { Avangate::SOAP.add_product({session_id: 1}) }.to raise_error MissingProductId
      end

    end

  end

end