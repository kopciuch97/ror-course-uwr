class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :sold_tickets, :class_name => 'Ticket', foreign_key: "owner_id"
  has_many :bought_tickets, :class_name => 'Ticket', foreign_key: "bought_by"
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
