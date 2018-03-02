class AdminUser < ApplicationRecord
  devise :database_authenticatable, :recoverable, :rememberable,
         :trackable, :confirmable, :lockable, :validatable
end
