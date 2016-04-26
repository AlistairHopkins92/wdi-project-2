class ChangePriceInJourneys < ActiveRecord::Migration
  def change
    remove_column :journeys, :price
    add_column :journeys, :price, :decimal
  end
end
