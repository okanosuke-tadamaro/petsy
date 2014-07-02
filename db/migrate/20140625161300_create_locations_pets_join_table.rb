class CreateLocationsPetsJoinTable < ActiveRecord::Migration
  def change
  	create_join_table :locations, :pets, table_name: :locations_pets
  end
end
