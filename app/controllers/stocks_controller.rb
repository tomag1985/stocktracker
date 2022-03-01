class StocksController < ApplicationController

	def create
		@stock = Stock.new(stock_params)
		@stock.user = current_user
		if @stock.save
			flash[:notice] = "Article saved!"
		end
	end

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
end
