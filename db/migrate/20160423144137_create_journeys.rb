class CreateJourneys < ActiveRecord::Migration
  def change
    create_table :journeys do |t|
      t.string :start_destination
      t.string :end_destination
      t.string :departure_date
      t.decimal :price, precision: 8, scale: 2
      t.integer :free_seats
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
