class User < ApplicationRecord
  has_many :trips
  def full_name
    "#{self.first_name}  #{self.last_name}"

  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
