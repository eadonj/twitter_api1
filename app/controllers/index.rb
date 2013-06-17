get '/' do
  erb :index
end

get '/:username' do
  @user = TwitterUser.find_or_create_by_username(params[:username])
  
  if @user.tweets_stale?
    @user.fetch_tweets!
  end
  @tweets = @user.tweets.limit(10)
  erb :tweets
end
