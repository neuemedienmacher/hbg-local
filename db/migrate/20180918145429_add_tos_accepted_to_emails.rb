class AddTosAcceptedToEmails < ActiveRecord::Migration[5.1]
  def change
    add_column :emails, :tos_accepted, :boolean, default: nil
  end
end
