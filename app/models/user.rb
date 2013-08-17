class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :lockable, :confirmable

  has_many :project_members
  has_many :projects, :through => :project_members
  has_many :stories, :through => :projects
  
  def gravatar_url size = false
  	"http://www.gravatar.com/avatar.php?gravatar_id="+
  	Digest::MD5.hexdigest(email).to_s + (size ? "?s=#{size}" : "")
  end
end
