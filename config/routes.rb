ActionController::Routing::Routes.draw do |map|

  map.root :controller => "application", :action => "index"
  map.logout 'logout', :controller => "user_sessions", :action => "destroy"
  map.login 'login', :controller => "user_sessions", :action => "new"
  map.resources :user_sessions, :only => [:new, :create, :destroy]
  map.resources :password_resets, :only => [:new, :create, :edit, :update]
  map.resources :battleships, :only => [:show, :index]
  
  map.register 'register', :controller => 'users', :action => 'new'
  map.resources :users, :only => [:new, :create]

  map.namespace :admin do |admin|
    admin.resources :battleships
    admin.resources :roles
    admin.resources :users
    admin.root :controller => 'admin', :action => 'index'
  end

  map.namespace :members do |members|
    members.resources :battleships, :member => {:favorite => :put}, :collection => {:favs => :get, :my_ships => :get}
    members.resources :users, :only => [:show, :edit, :update]
    members.root :controller => 'battleships', :action => 'index'
  end

end
