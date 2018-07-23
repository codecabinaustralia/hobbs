class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :project_users
  has_many :projects, through: :project_users
  has_one_attached :avatar

  def full_name
  	first_name + " " + last_name
  end

end
