class StocksController < ApplicationController
  
  def search
    if params[:stock].present?
      @stock = Stock.new_lookup(params[:stock])
      if @stock
        respond_to do |format|
          format.js { render partial: "users/result" }
        end
      else
        respond_to do |format|
          flash.now[:alert] = "Please enter a valid symbol"
          format.js { render partial: "users/result" }
        end
      end
=begin      
    else
      respond_to do |format|
        flash.now[:alert] = "Please enter a symbol"
        format.js { render partial: "users/result" }
      end
=end
    end
  end

  private

  def stock_params
    params.require(:stock).permit(:ticker, :name, :last_price)
  end
end
