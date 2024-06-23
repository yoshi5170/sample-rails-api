class CreateTodos < ActiveRecord::Migration[7.1]
  def change
    create_table :todos do |t|
      t.string :description, null: false
      t.boolean :completed, default: false
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
