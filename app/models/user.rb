class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :organizations
  #accepts_nested_attributes_for :organizations

  def fullname
    "#{first_name} #{last_name}"
  end

end
