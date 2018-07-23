class CreateQuoteMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :quote_messages do |t|
      t.text :body
      t.references :project, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
