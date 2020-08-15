class RemoveCityFromPet < ActiveRecord::Migration[6.0]
  def change
    remove_column :pets, :city
  end
end
