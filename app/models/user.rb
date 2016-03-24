class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  #  :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, :confirmable, :lockable

  has_many :posts, dependent: :destroy

  validates_uniqueness_of :name
  validates_presence_of :name



end
