class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :lockable, :confirmable

  has_many :initiated_sprints, :class_name => 'Sprint', :foreign_key => 'initiator_id'
  has_many :project_members
  has_many :projects, :through => :project_members
  has_many :stories, :through => :projects
  has_many :sprints, :through => :projects
  has_many :owned_projects, :class_name => "Project", :foreign_key => :initiator_id
  
  def gravatar_url size = false
  	"http://www.gravatar.com/avatar.php?gravatar_id="+
  	Digest::MD5.hexdigest(email).to_s + (size ? "?s=#{size}" : "")
  end
end
