require "http"
require "json"
require "./mappings/*"

module Twitcr::REST
  # Mixin for interacting with Twitch's REST API
  SSL_CONTEXT = OpenSSL::SSL::Context::Client.new
  API_BASE    = "https://api.twitch.tv/helix"

  EMPTY_RESULT = Exception.new("Empty Result")

  # Executes an HTTP request against the API_BASE url
  def request(method : String, route : String, version = "5", headers = HTTP::Headers.new, body : String? = nil)
    get_token unless @token

    headers["Authorization"] = @token || "test"
    headers["Client-ID"] = @client_id

    response = HTTP::Client.exec(
      method,
      API_BASE + route,
      headers,
      tls: SSL_CONTEXT
    )

    if response.status_code == 401
      get_token
      puts "Had to get new token"
      return request(method, route, version, headers, body)
    end

    response.body
  end

  def get_user_by_login(login : String)
    response = request(
      "GET",
      "/users?login=" + login
    )

    list = UserList.from_json(response)
    raise EMPTY_RESULT if list.data.empty?

    list.data.first
  end

  def get_user_by_id(id : Int64)
    response = request(
      "GET",
      "/users?id=" + id.to_s
    )

    list = UserList.from_json(response)
    raise EMPTY_RESULT if list.data.empty?

    list.data.first
  end

  def get_token
    response = HTTP::Client.exec(
      "POST",
      "https://id.twitch.tv/oauth2/token?client_id=#{@client_id}&client_secret=#{@client_secret}&grant_type=client_credentials",
      tls: SSL_CONTEXT
    )

    access_token = Token.from_json(response.body).access_token

    @token = "Bearer #{access_token}"
  end
end
