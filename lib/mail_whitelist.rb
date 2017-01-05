require 'mail_whitelist/version'

# Filter mails with a specific whitelist of e-mailaddresses and only leaves
# those in the 'to'.
class MailWhitelist
  attr_reader :whitelist, :fallback

  # @param [Array<String>, #include?] whitelist
  # @param [String] fallback
  def initialize(whitelist, fallback = nil)
    @whitelist = whitelist
    @fallback = fallback
  end

  def delivering_email(mail)
    mail.to = mail.to.select do |recipient|
      whitelist.include?(recipient)
    end
    mail.to = [fallback] unless mail.to.any?
  end
end
