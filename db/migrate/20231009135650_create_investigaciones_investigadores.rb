class CreateInvestigacionesInvestigadores < ActiveRecord::Migration[7.0]
  def change
    create_table :investigaciones_investigadores do |t|
      t.references :investigacion, null: false, foreign_key: true
      t.references :investigador, null: false, foreign_key: true

      t.timestamps
    end
  end
end
