require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "user confirmation email is sent to a new user's email" do
    user = users(:one)
    email = UserMailer.confirm_email(user).deliver

    assert !ActionMailer::Base.deliveries.empty?

    # Test the body of the sent email contains what we expect it to
    assert_equal ['info@shittytwitter.com'], email.from
    assert_equal [user.email], email.to
    assert_equal 'Confirm your email for Shitty Twitter', email.subject
  end
end
