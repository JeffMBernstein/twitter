require 'test_helper'

class TweetTest < ActiveSupport::TestCase
  test "tweet can get user's id" do
    tweet = tweets(:one)
    assert_equal tweet.user.id, users(:one).id
  end

  test "tweet can't be blank" do
    tweet = Tweet.new(content: "")
    tweet.save

    assert tweet.errors[:content].any?, 'Blank tweet can be created'
  end

  test "tweet can't be longer than 140 characters" do
    tweet = Tweet.new(content: "This is a huge line of text because I like to blog instead of tweeting. Tweeting is dumb, seriously... how can one say anything useful in 140 characters?")
    tweet.save

    assert tweet.errors[:content].any?, 'Long tweet can be created'
  end
end
