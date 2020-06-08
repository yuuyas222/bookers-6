class RemoveFollowerIdFromRelationship < ActiveRecord::Migration[5.2]
  def change
    remove_column :relationships, :followerId, :string
  end
end
