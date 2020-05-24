require "./rest"
require "./mappings/*"

class Twitcr::Client
  include REST

  getter token : String?
  getter client_id : String
  getter client_secret : String

  def initialize(@client_secret, @client_id)
    @token = nil
  end

  def user?(name : String)
    true if get_user_by_login(name)
  rescue EMPTY_RESULT
    false
  end

  def user(name : String)
    get_user_by_login(name)
  end

  def user(id : Int64)
    get_user_by_id(id)
  end
end
