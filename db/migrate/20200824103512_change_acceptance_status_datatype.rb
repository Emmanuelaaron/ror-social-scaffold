class ChangeAcceptanceStatusDatatype < ActiveRecord::Migration[5.2]
  def change
    change_column :friendships, :acceptance_status, :string
  end
end
