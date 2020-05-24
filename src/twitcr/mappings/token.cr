struct Twitcr::Token
  JSON.mapping({
    access_token: String,
    expires_in: Int64,
    token_type: String
  })
end
