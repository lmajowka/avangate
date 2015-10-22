require 'spec_helper'
require 'lib/stubs.rb'

module Avangate

  describe Notifications do

    before :each do

      Avangate::Base.secret_key = "AABBCCDDEEFF"

    end


    let (:notification) { Avangate::Notifications.new({
                                                          IPN_PID:["1"],
                                                          IPN_PNAME:['Software program'],
                                                          DATE: "20050303123434"
                                                      }) }

    it 'generates a receipts' do
      expect(notification.generate_receipt).to eq "<EPAYMENT>20050303123434|7bf97ed39681027d0c45aa45e3ea98f0</EPAYMENT>"
    end


  end

end