class AddUsersToInvestigador < ActiveRecord::Migration[7.0]
  def change
    add_reference :investigadors, :user, null: false, foreign_key: true
  end
end
