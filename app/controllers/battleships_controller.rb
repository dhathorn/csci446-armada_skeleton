class BattleshipsController < ApplicationController

  def index
    @battleships = Battleship.paginate :page => params[:page], :order => 'created_at DESC'
    respond_to do |format|
      format.html 
      format.xml { render :xml => @battleships }
    end
  end

end
