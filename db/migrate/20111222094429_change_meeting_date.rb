class ChangeMeetingDate < ActiveRecord::Migration
  def self.up
    change_table :meetings do |t|
      t.change :datetime, :datetime
    end
  end

  def self.down
    change_table :meetings do |t|
      t.change :datetime, :date
    end
  end
end
