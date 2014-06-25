class CreateBreeds < ActiveRecord::Migration
  def change
    create_table :breeds do |t|
      t.string :breed
      t.references :pet, index: true

      t.timestamps
    end
  end
end
