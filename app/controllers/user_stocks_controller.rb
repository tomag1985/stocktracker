class UserStocksController < ApplicationController

  def create
    stock = Stock.find_or_create_by(stock_params)
    user_stock = UserStock.new(stock: stock, user: current_user)
    flash[:notice] = 'Stock saved!' if user_stock.save
  end

  def destroy
    stock = Stock.find(stock_params)
		userstock = UserStock.find(stock: stock, user: current_user)
		flash[:notice] = 'Stock saved!' if userstock.destroy
  end

  private

  def stock_params
    params.require(:stock).permit(:ticker, :name, :last_price)
  end
end
