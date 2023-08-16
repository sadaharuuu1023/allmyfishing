class TweetsController < ApplicationController
  before_action :set_tweet, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, except: [:index, :show]
  
  def index
    @tweets = Tweet.all
  end
  
  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

end


private

  def tweet_params
    params.require(:tweet).permit(:title, :text_field, :text_tackle, :image).merge(user_id: current_user.id)
  end

  def set_tweet
    @tweet = tweet.find(params[:id])
  end

def move_to_index
  unless user_signed_in?
    redirect_to action: :index
  end
end