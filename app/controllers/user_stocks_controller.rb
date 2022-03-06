class UserStocksController < ApplicationController

  def create
    stock = Stock.find_or_create_by(stock_params)
    user_stock = UserStock.new(stock: stock, user: current_user)
    flash[:notice] = 'Stock saved!' if user_stock.save
  end

  def destroy
		userstock = UserStock.find_by(stock_id: params[:id], user_id: params[:user_id])
		flash[:alert] = 'Stock removed!' if userstock.destroy
  end

  private

  def stock_params
    params.require(:stock).permit(:ticker, :name, :last_price)
  end
end
