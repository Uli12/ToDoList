class CreateTodos < ActiveRecord::Migration[5.1]
  def change
    create_table :todos do |t|
      t.string :title
      t.string :date
      t.text :body
      t.boolean :completed

      t.timestamps
    end
  end
end
