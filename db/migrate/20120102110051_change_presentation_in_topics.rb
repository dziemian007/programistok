class ChangePresentationInTopics < ActiveRecord::Migration
  def self.up
    change_table :topics do |t|
      t.boolean :presentation
    end
  end

  def down
  end
end
