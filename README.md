# Avangate

This gem is a library to interact with Avangate SOAP API

Current methods implemented:

    #login
    #addProduct

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

## Usage

    @sessionId = Avangate::SOAP.login
    Avangate::SOAP.add_product({session_id: @sessionId, product_id: 423221})

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/avangate/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
