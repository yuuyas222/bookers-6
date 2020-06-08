class AddFollowIdToRelationship < ActiveRecord::Migration[5.2]
  def change
    add_column :relationships, :FollowId, :string
  end
end
