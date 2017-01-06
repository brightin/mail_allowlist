# MailWhitelist

MailWhitelist is a class you can provide as an
[interceptor](http://guides.rubyonrails.org/action_mailer_basics.html#intercepting-emails)
to your Rails app. It ensures only some people are able to receive mails from
your app and provides a fallback in case nobody would receive the mail. This
can be useful to make sure no accidental emails are sent from your staging
environment, but your mails can still be checked.

One way to use it is to set an environment variable `MAIL_WHITELIST` and check
for its existence and use it to instantiate the `MailWhitelist` class so that
within this environment only those email addresses will have mail sent to them.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mail_whitelist'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mail_whitelist

## Usage

Specify your whitelist as an array of email addresses and register them in an
initializer in your Rails app as such:

```ruby
require 'mail_whitelist'

whitelist = ['tom@brightin.nl']
ActionMailer::Base.register_interceptor(MailWhitelist.new(whitelist)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/brightin/mail_whitelist. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
