class RemoveAvatarToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      remove_column :users, :avatar

    end

  end
end
