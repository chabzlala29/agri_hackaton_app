class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :user_id
      t.string :question
      t.text :description
      t.string :tags, array: true, default: '{}'

      t.timestamps
    end
  end
end
