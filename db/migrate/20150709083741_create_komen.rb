class CreateKomen < ActiveRecord::Migration
  def change
    create_table :komen do |t|
      t.integer :post_id
      t.string :email
      t.text :isi

      t.timestamps
    end
  end
end
