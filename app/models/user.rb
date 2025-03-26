class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Devise modules
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  # Assign the admin role after creation (you can adjust this logic as per your needs)
  after_create :assign_admin_role

  private

  def assign_admin_role
    self.update(role: 'admin') if self.email == 'admin@example.com' # Or use another check for admins
  end
end
