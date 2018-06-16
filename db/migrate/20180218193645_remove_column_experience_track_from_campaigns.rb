# frozen_string_literal: true

class RemoveColumnExperienceTrackFromCampaigns < ActiveRecord::Migration[5.1]
  def change
    remove_column :campaigns, :experience_track
  end
end
