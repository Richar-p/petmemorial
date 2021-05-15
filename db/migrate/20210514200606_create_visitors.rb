# frozen_string_literal: true

class CreateVisitors < ActiveRecord::Migration[6.0]
  def change
    create_table :visitors do |t|
      t.string :ip_address
      t.timestamps
    end
  end
end
