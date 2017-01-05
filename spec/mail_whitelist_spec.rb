require 'spec_helper'
require 'ostruct'

RSpec.describe MailWhitelist do
  subject(:mail_whitelist) do
    described_class.new(['john@example.com', 'eric@example.com'],
                        'terry@example.com')
  end

  it 'is compatible with Mail interceptors' do
    expect(mail_whitelist).to respond_to(:delivering_email)
  end

  it 'removes recipients from an email using a whitelist' do
    email = OpenStruct.new(to: ['john@example.com', 'graham@example.com'])
    expect { mail_whitelist.delivering_email(email) }
      .to change { email.to }.to(['john@example.com'])
  end

  it 'will send the email to the fallback when no recipients remain' do
    email = OpenStruct.new(to: ['graham@example.com'])
    expect { mail_whitelist.delivering_email(email) }
      .to change { email.to }.to(['terry@example.com'])
  end
end
