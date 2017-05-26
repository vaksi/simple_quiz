class CreateFollows < ActiveRecord::Migration[5.0]
  def change
    create_table :follows do |t|
      t.references :quiz, foreign_key: true
      t.boolean :status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
