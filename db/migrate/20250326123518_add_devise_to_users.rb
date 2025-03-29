class AddDeviseToUsers < ActiveRecord::Migration[7.2]
  def self.up
    change_table :users do |t|
      ## Database authenticatable
      # t.string :email, null: false, default: ""
      # t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      # Removed the reset_password_token addition since it already exists
      # t.string :reset_password_token
      # t.datetime :reset_password_sent_at

      ## Rememberable
      # Removed the remember_created_at addition since it already exists
      # t.datetime :remember_created_at

      ## Trackable
      # t.integer :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.string :current_sign_in_ip
      # t.string :last_sign_in_ip

      ## Confirmable
      # t.string :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string :unconfirmed_email

      ## Lockable
      # t.integer :failed_attempts, default: 0, null: false
      # t.string :unlock_token
      # t.datetime :locked_at
    end

    # Skip creating the index if it already exists
    unless index_exists?(:users, :reset_password_token)
      add_index :users, :reset_password_token, unique: true
    end
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end
