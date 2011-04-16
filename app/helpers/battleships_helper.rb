module BattleshipsHelper

  def dynamic_star(battleship)
    if battleship.favorate
      return image_tag("icon_small_star.png", :border => 0, :title => "Toggle favorate")
    else
      return image_tag("icon_small_star_inactive.png", :border => 0, :title => "Toggle favorate")
    end
  end
  def truncate_and_link(battleship)
    trunc = truncate(battleship.description, :length => 55)
    trunc +="#{show_more(battleship.id)}" if battleship.description.length > 55
    trunc
  end
  
  def show_more(battleship)
    link_to_function("more") do |page|
      page.visual_effect :blind_down, "notrunc#{battleship}"
      page.toggle "trunc#{battleship}"
      page.toggle "notrunc#{battleship}"
    end
  end

  def owned_by(current_user, battleship) 
   battleship.user == current_user
  end

end
