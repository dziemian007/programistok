class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :title
      t.text :content
      t.string :speaker
      t.string :email
      t.boolean :proposal
      t.integer :meeting_id

      t.timestamps
    end
  end
end
