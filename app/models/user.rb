class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :parties
  has_and_belongs_to_many :attended_parties, class_name: 'Party'
  has_many :dishes

  def hosted_parties
    Party.where(host_id: self.id)
  end

end
