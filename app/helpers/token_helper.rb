module TokenHelper
  def current_terminal
    @current_terminal ||= TokenAuthenticator.authenticate(request.headers['X-Terminal-Token'],
                                                          request.headers['X-Terminal-Title'])
  end

  def authenticate_terminal!
    return if current_terminal
    raise TokenAuthenticator::TokenInvalid.new('access token invalid')
  end
end
