class AddFollowerIdToRelationship < ActiveRecord::Migration[5.2]
  def change
    add_column :relationships, :FollowerId, :string
  end
end
