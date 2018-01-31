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
    mail.to = mail.to.select { |recipient| whitelisted?(recipient) }
    mail.to = [fallback] unless mail.to.any?
  end

  private

  def whitelisted?(recipient)
    whitelist.any? do |whitelisted_address|
      if whitelisted_address.start_with?('@')
        recipient.end_with?(whitelisted_address)
      else
        whitelisted_address == recipient
      end
    end
  end
end
