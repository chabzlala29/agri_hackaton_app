class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :question_id
      t.text :answer
      t.integer :user_id

      t.timestamps
    end
  end
end
