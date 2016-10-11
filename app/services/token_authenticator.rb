module TokenAuthenticator
  class TokenInvalid < StandardError; end

  def self.authenticate(token, title)
    access_key = AccessKey.where(access_token: token, expired: false).first
    if access_key && access_key.terminal.title == title && !access_key.expired?
      access_key.terminal
    else
      nil
    end
  end

  def self.create!(terminal)
    AccessKey.create!(terminal: terminal).access_token
  end

  def self.expire!(access_token)
    AccessKey.find_by(access_token: access_token).expire!
  end
end
