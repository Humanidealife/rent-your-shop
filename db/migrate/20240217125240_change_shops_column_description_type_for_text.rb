class ChangeShopsColumnDescriptionTypeForText < ActiveRecord::Migration[7.1]
  def change
    change_column :shops, :description, :text
  end
end
