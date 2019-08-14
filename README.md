# twitcr

Very limited API Rest wrapper for interacting with twitch. Not planning on finishing.

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     twitcr:
       github: your-github-user/twitcr
   ```

2. Run `shards install`

## Usage

```crystal
require "twitcr"

Twitcr::Client.new(oauth_token, oauth_id).user?(channel)
```

TODO: Write usage instructions here

## Development

TODO: Write development instructions here

## Contributing

1. Fork it (<https://github.com/your-github-user/twitcr/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Jonathan B.](https://github.com/your-github-user) - creator and maintainer
