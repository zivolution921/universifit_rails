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

  validates :name, presence: true

  with_options if: :persisted? do |opts|
    #opts.validates :location_id, presence: :has_no_custom_location?
    #opts.validates :custom_location, presence: :has_no_location_id?
    opts.validates :password, presence: :password_changed?
    opts.validates :password_confirmation, presence: :password_changed?
  end

  def has_no_custom_location?
    self.custom_location.blank?
  end

  def has_no_location_id?
    self.location_id.blank?
  end

  def password_changed?
    self.password.present?
  end

  def to_s
    "#{@name} - #{@email}"
  end

end
