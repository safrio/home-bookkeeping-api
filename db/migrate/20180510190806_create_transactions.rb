class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.float :sum, null: false
      t.datetime :published_at, default: -> { 'CURRENT_TIMESTAMP' }
      t.integer :direction
    end

    add_reference :transactions, :category, references: :categories, index: true
    add_foreign_key :transactions, :categories, column: :category_id
  end
end
