class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.integer :pf_id
      t.string	:shelter_id
      t.string 	:animal_type
      t.string 	:name
      t.string	:age
      t.string	:sex
      t.string	:size
      t.text		:description
      t.string	:last_update

      t.timestamps
    end
  end
end