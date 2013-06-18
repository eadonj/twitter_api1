get '/' do
  erb :index
end


get '/test' do 
  p params
end

get '/updated' do
  user = TwitterUser.find_or_create_by_username(params[:username])
  user.fetch_tweets!
  @tweets = user.tweets.limit(10)
  @stale = false
  erb :_tweets, :layout => false
end

get '/:username' do
  @user = TwitterUser.find_or_create_by_username(params[:username])
  @stale = @user.tweets_stale?
  @tweets = @user.tweets.limit(10)
  erb :_tweets
end



