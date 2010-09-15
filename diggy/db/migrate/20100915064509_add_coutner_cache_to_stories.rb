class AddCoutnerCacheToStories < ActiveRecord::Migration
  def self.up
    add_column :stories, :votes_count, :integer, :default => 0 # initialisation a zero
    Story.find(:all).each do |s| # calcule le compteur pour toutes les story
      s.update_attribute :votes_count, s.votes.length
    end
  end

  def self.down
    remove_column :stories, :votes_count
  end
end