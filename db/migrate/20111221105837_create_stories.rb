class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :title
      t.string :content
      t.string :teaser
      t.string :slug

      t.timestamps
    end
  end
end
