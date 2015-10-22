require 'spec_helper'
require 'lib/stubs.rb'

module Avangate

  describe SOAP do

    it 'should return now in the correct format' do
      expect(Avangate::SOAP.send(:now)).to match /[0-9]+{4}-[0-9]+{2}-[0-9]+{2}\s[0-9]+{2}:[0-9]+{2}:[0-9]+{2}/
    end

    describe '#login' do
      before :each do
        allow(Avangate::SOAP).to receive(:client) do
          ClientStub.new
        end
      end

      it 'should return session_id == 1' do
        expect(Avangate::SOAP.login).to eq(1)
      end

    end

    describe '#add_product' do

      before :each do
        allow(Avangate::SOAP).to receive(:client) do
          ClientStub.new
        end
      end

      it 'should require session_id' do
        expect { Avangate::SOAP.add_product }.to raise_error MissingSessionId
      end

      it 'should require product_id' do
        expect { Avangate::SOAP.add_product({session_id: 1}) }.to raise_error MissingProductId
      end

      it 'should return 2' do
        expect(Avangate::SOAP.add_product({session_id: 1, product_id: 1})).to eq(1)
      end

    end

      describe '#get_product_by_code' do

      before :each do
        allow(Avangate::SOAP).to receive(:client) do
          ClientStub.new
        end
      end

      it 'should require session_id' do
        expect { Avangate::SOAP.get_product_by_code }.to raise_error MissingSessionId
      end

      it 'should require product_id' do
        expect { Avangate::SOAP.get_product_by_code({session_id: 1}) }.to raise_error MissingProductCode
      end

      it 'should return 4' do
        expect(Avangate::SOAP.get_product_by_code({session_id: 1, product_code: 1})).to eq(1)
      end

    end

  end

end

