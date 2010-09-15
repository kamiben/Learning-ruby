class AddDescriptionToStories < ActiveRecord::Migration
  def self.up
    add_column :stories, :descriptions, :text
  end

  def self.down
    remove_column :stories, :descriptions
  end
end
