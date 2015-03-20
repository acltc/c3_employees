# C3Employees

A gem that allows you to easily access data about Chicago employees. 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'c3_employees'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install c3_employees

## Usage

To grab all the Chicago employees, use this command:

```ruby
C3Employees::Employee.all
```

To grab employees based on a specific search term:

```ruby
C3Employees::Employee.find(YOUR-SEARCH-TERM-HERE)
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/c3_employees/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
