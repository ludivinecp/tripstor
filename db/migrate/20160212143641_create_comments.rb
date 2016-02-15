class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :title
      t.text :review
      t.integer :stars
      t.references :users, index: true
      t.references :companies, index: true

      t.timestamps null: false
    end
  end
end
