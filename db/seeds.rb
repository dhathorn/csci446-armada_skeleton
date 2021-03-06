PaperTrail.whodunnit = 'Seed Data Script'


# Seed the roles.
Role.create!(:name => 'developer', :description => 'The system developer. There is no higher access level.')
Role.create!(:name => 'administrator', :description => 'A system administrator. Full access to all features.')
Role.create!(:name => 'member', :description => 'A typical application user.')


# Seed developer users.
r = Role.find_by_name('developer')

team_member_1 = User.new(:first_name => 'Joshua',
                         :last_name => 'Warner',
                         :email => 'jowarner@mines.edu',
                         :password => 'changeme',
                         :password_confirmation => 'changeme',
                         :role => r)
team_member_1.save_without_session_maintenance

team_member_2 = User.new(:first_name => 'Daniel',
                         :last_name => 'Hathorn',
                         :email => 'dhathorn@mines.edu',
                         :password => 'changeme',
                         :password_confirmation => 'changeme',
                         :role => r)
team_member_2.save_without_session_maintenance

yong = User.new(:first_name => 'Yong',
                :last_name => 'Bakos',
                :email => 'ybakos@mines.edu',
                :password => 'changeme',
                :password_confirmation => 'changeme',
                :role => r)
yong.save_without_session_maintenance

#seed some battleships

0.upto(10) do |n|
  Battleship.create(:name => "USS Iowa#{n}", :description =>  "Iowa class battleship", :cost => '100000',
                  :user => User.find_by_first_name("Daniel"))
end
