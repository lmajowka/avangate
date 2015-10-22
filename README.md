# Avangate

This gem is a library to interact with Avangate SOAP API
And to manage IPN - Payment Notifications

Current methods implemented:

    SOAP:

    #login
    #addProduct
    #setBillingDetails
    #get_product_by_code

    Notifications:

    #generate_receipt

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'avangate'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install avangate

You need to provide your secret key and your merchant code, both you can get when you sign in to avangate website, then you need to create an initializer

    config/initializers/avangate.rb

Inside you can and set up:

    Avangate::Base.secret_key = "SECRET_KEY"
    Avangate::Base.merchant_code = "MERCHANT_CODE"

## Example of usage

    SOAP:

    @sessionId = Avangate::SOAP.login
    Avangate::SOAP.add_product({session_id: @sessionId, product_id: 423221})
    Avangate::SOAP.set_billing_details({
      session_id: @sessionId,
      address: '4 street',
      city: 'dream city',
      country: 'US',
      email: 'john.doe@example.com',
      first_name: 'John',
      last_name: 'Doe',
      postal_code: '12333',
      state: 'Alabama'
    })


    product = Avangate::SOAP.get_product_by_code({
      session_id: @sessionId,
      product_code: 123
    })


    IPN:

    render text: Avangate::Notification.generate_receipt


## Contributing

1. Fork it ( https://github.com/[my-github-username]/avangate/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
