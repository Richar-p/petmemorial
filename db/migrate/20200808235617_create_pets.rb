# frozen_string_literal: true

class CreatePets < ActiveRecord::Migration[6.0]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :country
      t.string :city
      t.string :race
      t.date :birth_date
      t.date :death_date
      t.boolean :is_published
    end
  end
end
