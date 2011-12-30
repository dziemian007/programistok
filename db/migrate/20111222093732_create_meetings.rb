class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.string :title
      t.text :content
      t.date :datetime
      t.string :place

      t.timestamps
    end
  end
end
