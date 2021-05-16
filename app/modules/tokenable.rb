module Tokenable
  def assign_access_token
    loop do
      self.access_token = friendly_token
      break unless self.class.exists?(access_token: access_token)
    end
  end

  def generate_access_token!
    assign_access_token
    save(validate: false)
  end

  def assign_confirmation_token
    loop do
      self.confirmation_token = SecureRandom.urlsafe_base64(12)
      break unless self.class.exists?(confirmation_token: confirmation_token)
    end
  end

  def generate_confirmation_token!
    assign_confirmation_token
    save(confirmed: false)
  end

  def generate_verification_token
    loop do
      self.verification_token = SecureRandom.hex(4)
      break unless self.class.exists?(verification_token: verification_token)
    end
  end

  def friendly_token
    SecureRandom.base64(15).tr('+/=lIO0', 'pqrsxyz')
  end
end