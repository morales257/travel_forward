class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :name, unique: true
      t.string :title
      t.text :description
      t.integer :author_id

      t.timestamps null: false
    end
  end
end
