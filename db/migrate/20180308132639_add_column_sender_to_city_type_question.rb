class AddColumnSenderToCityTypeQuestion < ActiveRecord::Migration[5.1]
  def change
    add_column :city_type_questions, :sender, :string
  end
end
