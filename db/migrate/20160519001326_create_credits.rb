class CreateCredits < ActiveRecord::Migration
  def change
    create_table :credits do |t|
      t.integer :user_id
      t.integer :credit_balance

      t.timestamps null: false
    end
    add_index :credits, :user_id
  end
end
