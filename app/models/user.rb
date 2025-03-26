class User < ApplicationRecord
  # Include default devise modules.
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  # Validate that only one admin user exists
  validate :only_one_admin, on: :create

  # Assign the admin role after creation if the email matches (or any other condition)
  after_create :assign_admin_role

  # Prevent non-admin users from signing in
  validate :admin_user_only, on: :create, if: :admin?

  private

  def only_one_admin
    # Only validate if the user is an admin
    if admin? && User.where(admin: true).exists?
      errors.add(:base, "Only one admin user can exist.")
    end
  end

  def assign_admin_role
    # Assign the admin role if the user's email matches a predefined admin email
    if self.email == 'erictodasco@me.com' # You can adjust this check as needed
      self.update(role: 'admin', admin: true) # Ensure the role and admin flag are set
    end
  end

  # Custom validation to ensure only the admin user can sign in
  def admin_user_only
    if User.where(admin: true).count > 1 && !self.admin?
      errors.add(:base, "Only the admin can sign in.")
    end
  end
end
