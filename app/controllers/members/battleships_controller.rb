class Members::BattleshipsController < Members::MembersController
  def index
    @battleships = Battleship.paginate :page => params[:page], :order => 'created_at DESC'
    respond_to do |format|
      format.html 
      format.xml { render :xml => @battleships }
    end
  end

  def show
    @battleship = Battleship.find(params[:id])
    respond_to do |format|
      format.html
      format.xml { render :xml => @battleship }
    end
  end

  def new
    @battleship = Battleship.new
    respond_to do |format|
      format.html
      format.xml { render :xml => @battleship }
    end
  end

  def create
    @battleship = Battleship.new(params[:battleship])
    @battleship.user = current_user
    respond_to do |format|
      if @battleship.save
        format.html {redirect_to( root_path, :notice => "Successfully added #{@battleship.name}") }
        format.xml  { render :xml => @battleship, :status => :created, :location => @battleship }
      else
        flash[:error] = "Could not create battleship"
        format.html {render :action => "new"}
        format.xml  { render :xml => @battleship.errors, :status => :unprocessable_entity }
      end
    end
  end


  def edit
    @battleship = Battleship.find(params[:id])
  end


  def update
    @battleship = Battleship.find(params[:id])
    
    respond_to do |format|
      if @battleship.update_attributes(params[:battleship])
        format.html {redirect_to( members_root_path, :notice => 'battleship was successfully updated.')}
        format.xml { head :ok }
      else
        render :action => "edit" 
        format.xml  { render :xml => @battleship.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy 
    @battleship = Battleship.find(params[:id])
    @battleship.destroy
    respond_to do |format|
      format.html {redirect_to(members_battleships_url)}
      format.xml { head :ok}
    end
  end

  def favorite
    @battleship = Battleship.find(params[:id])
    @battleship.favorite ? @battleship.update_attribute(:favorite, false) : @battleship.update_attribute(:favorite, true)
    respond_to do |format|
      format.html {redirect_to members_battleships_path}
      format.js
      format.xml {head :ok}
    end
  end

end
