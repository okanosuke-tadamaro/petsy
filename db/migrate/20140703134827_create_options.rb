class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.string :option

      t.timestamps
    end
  end
end
