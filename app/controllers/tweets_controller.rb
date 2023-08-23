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

  def edit
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @tweet.update(tweet_params)
      redirect_to tweet_path(@tweet)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
  end

  def destroy
    if @tweet.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

end


private

  def tweet_params
    params.require(:tweet).permit(:title, :text_field, :text_water_depth, :text_terrain, :text_tide, :text_rod, :text_reel, :text_line, :text_leader, :text_lure, :text_color, :image).merge(user_id: current_user.id)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

def move_to_index
  unless user_signed_in?
    redirect_to action: :index
  end
end