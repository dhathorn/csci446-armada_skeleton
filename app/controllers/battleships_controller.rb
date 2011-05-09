class BattleshipsController < ApplicationController

  def index
    respond_to do |format|
      @battleships = Battleship.all
      format.xml { render :xml => @battleships }
    end
  end

  def show
    @battleship = Battleship.find(params[:id])
    respond_to do |format|
      format.xml { render :xml => @battleship }
    end
  end


end
