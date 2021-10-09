struct Twitcr::Token
  include JSON::Serializable

  property access_token : String
  property expires_in : Int64
  property token_type : String
end
