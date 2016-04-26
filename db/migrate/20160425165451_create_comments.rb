class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :journey, index: true, foreign_key: true
      t.string :agreed_setoff_time
      t.text :notes
      t.string :status
      t.integer :sender_id
      t.integer :receiver_id

      t.timestamps null: false
    end
  end
end
