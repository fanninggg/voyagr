class AddColumnSenderToCityTypeAnswer < ActiveRecord::Migration[5.1]
  def change
    add_column :city_type_answers, :sender, :string
  end
end
