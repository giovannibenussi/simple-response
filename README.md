[![Maintainability](https://api.codeclimate.com/v1/badges/54e7c14cd8f10bd26aa5/maintainability)](https://codeclimate.com/github/giovannibenussi/simple-response/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/54e7c14cd8f10bd26aa5/test_coverage)](https://codeclimate.com/github/giovannibenussi/simple-response/test_coverage)
<a target="_blank" href="https://badge.fury.io/rb/simple_response"><img src="https://badge.fury.io/rb/simple_response.svg" alt="Gem Version" height="18"></a>

# SimpleResponse

SimpleResponse is a lightweight gem that will allow you to create Response Objects in an easy but robust way.

Basically, a Response Object is an object that improves the communication between the functions of your application. By using them, you will be able to reduce the number of bugs and its hunt easier than alternative ways like return boolean or string values.

<!-- In a Response Object you have two types of responses: success and failures. Also, you could associate any data that you want with the Response Object in case you need to provide extra data. -->
In a Response Object you can have two types of responses (success and failure) and any custom associated data that you want.

Following is a simple code that uses SimpleResponse to improve both its readability and flow control.

```ruby
response = ThirdPartyAPI.get('posts')
if response.success?
  puts "Post retrieval succeeds in #{response.retrieval_time}"
  puts "We retrieve #{response.posts.count} posts."
else
  puts "Error retrieving posts: #{response.error_message}"
end
```

To implement this, you could write something like this using SimpleResponse gem:

```ruby
class ThirdPartyAPI
  def get('posts')
    # call third party api...
    SimpleResponse.success(posts: posts, retrieval_time: retrieval_time)
  rescue ThirdPartyAPI::CredentialsError => e
    SimpleResponse.failure(error_message: 'invalid credentials')
  end
end
```

## Why?

By using Response Objects you will be able to reduce the number and difficulty of your bugs because you will be easing the communication between your application layers that is where bugs used to come from.

SimpleResponse's proposal is a lightweight <a href="http://rubyonrails.org/doctrine/#beautiful-code" target="_blank">syntactic sugar for your response objects</a>.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'simple_response'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install simple_response

## Usage

Create a success response object:

```ruby
response = SimpleResponse.success(user_id: 1)

response.success? # true
response.user_id  # 1
response.failure? # false
```

Create a failure response object:

```ruby
response = SimpleResponse.failure(user_id: 1)

response.success? # false
response.user_id  # 1
response.failure? # true
```

You also have automatically query methods on boolean attributes:

```
response.works = true
response.works  # true
response.works? # true
```

To define dynamically the response status you could call directly the method new on SimpleResponse's class:

```ruby
SimpleResponse.new(success: true)

# with custom data:
SimpleResponse.new(success: true, user_id: 1)
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/giovannibenussi/simple_response. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

<!-- ## Code of Conduct

Everyone interacting in the SimpleResponse project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/giovannibenussi/simple_response/blob/master/CODE_OF_CONDUCT.md). -->
