require "test_helper"

class UserMailerTest < ActionMailer::TestCase
  test "subscription_mailer" do
    mail = UserMailer.subscription_mailer
    assert_equal "Subscription mailer", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
