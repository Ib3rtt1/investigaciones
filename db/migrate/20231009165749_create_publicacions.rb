class CreatePublicacions < ActiveRecord::Migration[7.0]
  def change
    create_table :publicacions do |t|
      t.string :name
      t.integer :date
      t.string :title
      t.text :resume

      t.timestamps
    end
  end
end
