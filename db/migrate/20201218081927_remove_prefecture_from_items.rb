class RemovePrefectureFromItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :items, :prefectre, :integer
  end
end
