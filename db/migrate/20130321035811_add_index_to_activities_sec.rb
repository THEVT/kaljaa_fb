class AddIndexToActivitiesSec < ActiveRecord::Migration
  def change
	add_index :activities, [:profile_id]
  end
end
