class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.text :content
      t.integer :profile_id

      t.timestamps
    end
  end
end
