class RollsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  respond_to :html, :js

  def home
    @rolls = []

    3.times { @rolls << Roll.create }

    @win = "WINNER!!" if @rolls.map! { |roll| roll.value }.uniq.count == 1
  end

  def rolling
    @rolls = []


    respond_to do |format| 
     format.js   {  }
      # TIP: Qué vista debe mostrar?
      puts "*" * 50
      if params[:value]
        3.times { @rolls << Roll.create({ value: value }) }
      else
        3.times { @rolls << Roll.create }
      end

      @win = "WINNER!!" if @rolls.map! { |roll| roll.value }.uniq.count == 1

     
    end
  end
end
