class Members::BattleshipsController < Members::MembersController
  def index
    @battleships = Battleship.paginate :page => params[:page], :order => 'created_at DESC'
    render
  end

  def show
    @battleship = Battleship.find(params[:id])
  end

  def new
    @battleship = Battleship.new
  end

  def create
    @battleship = Battleship.new(params[:battleship])
    @battleship.user = current_user
    if @battleship.save
     redirect_to( root_path, :notice => "Successfully added #{@battleship.name}")
    else
      flash[:error] = "Could not create battleship"
      render :action => "new"
    end
  end

  def edit
    @battleship = Battleship.find(params[:id])
  end

  def update
    @battleship = Battleship.find(params[:id])

    if @battleship.update_attributes(params[:battleship])
      redirect_to( members_root_path, :notice => 'battleship was successfully updated.')
    else
      render :action => "edit" 
    end
  end

  def destroy 
    @battleship = battleship.find(params[:id])
    @battleship.destroy
    redirect_to(members_battleships_url)
  end

end
