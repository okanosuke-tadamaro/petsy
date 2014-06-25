class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :url
      t.references :pet, index: true

      t.timestamps
    end
  end
end
