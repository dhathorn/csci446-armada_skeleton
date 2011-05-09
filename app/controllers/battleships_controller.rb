class BattleshipsController < ApplicationController

  def index
    @battleships = Battleship.paginate :page => params[:page], :order => 'created_at DESC'
    respond_to do |format|
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
