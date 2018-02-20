class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]
  has_many :parties
  has_and_belongs_to_many :attended_parties, class_name: 'Party'
  has_many :dishes

  def hosted_parties
    Array.new(Party.where(host_id: self.id))
  end

  def all_parties
    parties = []
    Party.all.each do |party|
      parties << party if party.attendees.include?(self)
    end
    parties + hosted_parties
  end

  def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
      end
  end
end
