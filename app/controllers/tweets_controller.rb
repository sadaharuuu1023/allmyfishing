class TweetsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  
  def index
    @tweet = Tweet.all
  end
end


private

  def tweet_params
    params.require(:tweet).permit(:content, :image).merge(user_id: current_user.id)
  end

def move_to_index
  unless user_signed_in?
    redirect_to action: :index
  end
end