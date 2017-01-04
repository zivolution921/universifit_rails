class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :friends, 
              class_name: "User", 
              join_table: :friendships, 
              foreign_key: :user1_id, 
              association_foreign_key: :user2_id
  has_many :availabilities

  def to_s
    "#{@name} - #{@email}"
  end

end
