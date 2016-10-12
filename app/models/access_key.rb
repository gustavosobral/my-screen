class AccessKey < ActiveRecord::Base
  belongs_to :terminal

  before_create :generate_access_token

  def expire!
    self.expired = true
    save!
  end

  private

  def generate_access_token
    loop do
      self.access_token = SecureRandom.hex
      break unless AccessKey.where(access_token: access_token).exists?
    end
  end
end
