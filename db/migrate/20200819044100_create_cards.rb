class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.references :article, null: false
      t.string :title
      t.text :content, null: false
      t.timestamps
    end
  end
end
