class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title, null: false, length: { minimum: 40 }
      t.string :description, null: false, length: { minimum: 150 }
      t.belongs_to :user, null: false

      t.timestamps null: false
    end
  end
end
