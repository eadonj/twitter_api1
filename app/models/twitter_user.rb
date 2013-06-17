class TwitterUser < ActiveRecord::Base
  has_many :tweets
  
  def tweets_stale?
    time = Time.now - self.tweets.last.updated_at
    (time / 60) > 15
  end    

  def fetch_tweets!
    self.tweets.delete_all
    tweets = Twitter.user_timeline(self.username)
    tweets.each { |tweet| Tweet.create(:body => tweet.text, twitter_user: self) }
  end
end
