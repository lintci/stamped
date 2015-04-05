# Stamped

This gem extends Time with a couple useful methods for dealing with iso8601 encoded times in UTC.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'stamped'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install stamped

## Usage

``` ruby
Time.stamp #=> "2015-03-25T00:52:34Z"
Time.stamp(Time.at(0)) #=> "1970-01-01T00:00:00Z"
Time.from_stamp("2015-03-25T00:52:34Z") #=> 2015-03-25 00:52:34 UTC
Time.now.stamp #=> "2015-03-25T00:53:36Z"
Time.stamp_time #=> 2015-03-25 00:53:44 UTC
```

## Testing

When testing with time, you often just want to make sure you have a valid timestamp, rather than a specific time. To aid this case, you can use the `be_timestamp` matcher.

``` ruby
# spec_helper.rb
require 'stamped/rspec'

# delivery.rb
class Delivery
  def initialize(time)
    @time = time
  end

  def timestamp
    @time.stamp
  end

  # ...
end

# delivery_spec.rb
require 'spec_helper'

describe Delivery do
  it 'has a valid timestamp' do
    delivery = Delivery.new(3.days.from_now)

    expect(delivery.timestamp).to be_timestamp
  end
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/lintci/stamped/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
