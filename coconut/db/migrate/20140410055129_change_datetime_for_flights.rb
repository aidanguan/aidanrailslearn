class ChangeDatetimeForFlights < ActiveRecord::Migration
  def change
    remove_column :flights, :datetime
  end
end
