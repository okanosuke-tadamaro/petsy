class CreateOptionsPetsJoinTable < ActiveRecord::Migration
  def change
  	create_join_table :options, :pets, table_name: :options_pets
  end
end
