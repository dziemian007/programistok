class AddPresentationToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :presentation, :integer
    remove_column :topics, :proposal
  end
end
