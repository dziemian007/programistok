class ChangePresentationInTopics < ActiveRecord::Migration
  def self.up
    change_table :topics do |t|
      t.change :presentation, :boolean
    end
  end

  def down
  end
end
