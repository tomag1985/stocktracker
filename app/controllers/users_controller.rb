class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def my_portfolio
    @tracked_stocks = current_user.stocks
  end
end
