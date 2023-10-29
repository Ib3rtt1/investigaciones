
class CreateInvestigadoresInvestigaciones < ActiveRecord::Migration[6.0]
  def change
    create_table :investigadores_investigaciones, id: false do |t|
      t.references :investigador, foreign_key: true
      t.references :investigacion, foreign_key: true
    end
  end
end
