class AddRememberTokenToAccounts < ActiveRecord::Migration
  def change
	#remove_column :accounts, :session_id
	#add_column :accounts, :remember_token, :string
	add_index  :accounts, :remember_token
  end
end
