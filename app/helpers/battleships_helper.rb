module BattleshipsHelper
  
  def owned_by(current_user, battleship) 
   battleship.user == current_user
  end

end
