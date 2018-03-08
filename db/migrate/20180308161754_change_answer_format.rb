class ChangeAnswerFormat < ActiveRecord::Migration[5.1]
  def change
    remove_column :price_answers, :content
    add_column :price_answers, :title, :string
    add_column :price_answers, :payload, :string

    remove_column :location_answers, :content
    add_column :location_answers, :title, :string
    add_column :location_answers, :payload, :string

    remove_column :evening_answers, :content
    add_column :evening_answers, :title, :string
    add_column :evening_answers, :payload, :string

    remove_column :city_type_answers, :content
    add_column :city_type_answers, :title, :string
    add_column :city_type_answers, :payload, :string

  end
end
