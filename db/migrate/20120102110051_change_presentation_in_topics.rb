class ChangePresentationInTopics < ActiveRecord::Migration
  def self.up
    change_table :topics do |t|
      t.remove :presentation
      t.boolean :presentation
    end
  end

  def down
    change_table :topics do |t|
      t.remove :presentation
      t.integer :presentation
    end
  end
end
