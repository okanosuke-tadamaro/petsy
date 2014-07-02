class CreateBreedsPetsJoinTable < ActiveRecord::Migration
  def change
  	create_join_table :breeds, :pets, table_name: :breeds_pets
  end
end
