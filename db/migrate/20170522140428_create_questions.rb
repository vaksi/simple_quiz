class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.string :description
      t.string :answare
      t.references :quiz, foreign_key: true

      t.timestamps
    end
  end
end
