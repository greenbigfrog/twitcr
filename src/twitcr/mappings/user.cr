require "./converters"

module Twitcr
  struct UserList
    include JSON::Serializable

    property data : Array(User)
  end

  struct User
    include JSON::Serializable

    @[JSON::Field(converter: ID::Converter)]
    property id : UInt64

    property login : String
    property display_name : String
  end
end

module ID::Converter
  def self.from_json(value : JSON::PullParser) : UInt64
    UInt64.new(value.read_string)
  end
end
