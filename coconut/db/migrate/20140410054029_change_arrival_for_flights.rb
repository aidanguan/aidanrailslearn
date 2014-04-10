class ChangeArrivalForFlights < ActiveRecord::Migration
  def change
    change_column :flights, :arrival, :datetime
  end
end
