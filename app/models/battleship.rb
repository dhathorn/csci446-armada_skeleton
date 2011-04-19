class Battleship < ActiveRecord::Base 

  cattr_reader :per_page
  validates_length_of :name, :minimum => 1
  validates_presence_of :name
  validates_numericality_of :cost

  has_attached_file :image, 
    :styles => { :medium => "300x300#", :thumb => "72x72#" },
    :default_url => '/images/default_battleship.png',
    :storage => :s3,
    :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
    :path => "cs446/giraffe/#{Rails.env}/:attachment/:id/:style.:extension"
  belongs_to :user

  @@per_page = 10

  def to_s
    self.name
  end
  protected

end



# == Schema Information
#
# Table name: battleships
#
#  id          :integer         not null, primary key
#  name        :string(255)     not null
#  description :string(255)
#  cost        :integer
#  user_id     :integer         default(0)
#  created_at  :datetime
#  updated_at  :datetime
#  favorite    :boolean         default = false
#
