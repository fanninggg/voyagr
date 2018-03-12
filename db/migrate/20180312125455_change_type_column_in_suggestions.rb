class ChangeTypeColumnInSuggestions < ActiveRecord::Migration[5.1]
  def change
    rename_column :suggestions, :type, :result_type
  end
end
