class AddPresentationToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :presentation, :boolean
    remove_column :topics, :proposal
  end
end
