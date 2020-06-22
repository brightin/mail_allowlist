require 'mail_allowlist/version'

# Filter mails with a specific allowlist of e-mailaddresses and only leaves
# those in the 'to'.
class MailAllowlist
  attr_reader :allowlist, :fallback

  # @param [Array<String>, #include?] allowlist
  # @param [String] fallback
  def initialize(allowlist, fallback = nil)
    @allowlist = allowlist
    @fallback = fallback
  end

  def delivering_email(mail)
    mail.to = mail.to.select { |recipient| allowlisted?(recipient) }
    mail.to = [fallback] unless mail.to.any?
  end

  private

  def allowlisted?(recipient)
    allowlist.any? do |allowlisted_address|
      if allowlisted_address.start_with?('@')
        recipient.end_with?(allowlisted_address)
      else
        allowlisted_address == recipient
      end
    end
  end
end
