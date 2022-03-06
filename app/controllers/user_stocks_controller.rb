class UserStocksController < ApplicationController

  def create
    stock = Stock.find_by(ticker: params[:stock][:ticker])

    stock ? stock.save : stock = Stock.new(name: params[:stock][:name], ticker: params[:stock][:ticker])

    user_stock = UserStock.new(stock: stock, user: current_user)
    flash[:notice] = 'Stock saved!' if user_stock.save
  end

  def destroy
    userstock = UserStock.find_by(stock_id: params[:id], user_id: params[:user_id])
    flash[:alert] = 'Stock removed!' if userstock.destroy
  end
end
