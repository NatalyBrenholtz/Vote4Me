class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.string :title, null: false
      t.text :description, default: ""
      t.integer :score, default: 0
      t.references :user, index: true

      t.timestamps
    end
  end
end
