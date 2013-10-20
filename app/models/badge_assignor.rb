class BadgeAssignor
  attr_accessor :user, :badge

  def assign
    user.badges << badge
    tweet if user.twitter_enabled?
  end

  private

  def tweet
    Twitter.tweet(user.twitter_account, badge.message)
  end
end
