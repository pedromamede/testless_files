# TestlessFiles

Find files that are not being tested at all (rspec pattern)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'testless_files'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install testless_files

## Usage

Add this to your rails_helper.rb file (after the requires)

```ruby
TestlessFiles.verify!
```

If you need to specify new patterns use the config block. You can add it on any initializer (e.g testless_files.rb)

```ruby
require 'testless_files'

TestlessFiles.configure do |c|
  c.watch_folders = %w(models controllers mailers workers services businesses serializers)
end
```

## Contributing

Feel free to send pull requests =]


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

