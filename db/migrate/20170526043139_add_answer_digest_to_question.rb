class AddAnswerDigestToQuestion < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :answer_digest, :string
  end
end
