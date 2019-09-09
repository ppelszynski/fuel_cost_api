class CreatePb95s < ActiveRecord::Migration[6.0]
  def change
    create_table :pb95s do |t|
      t.float :price
      t.float :diffrence

      t.timestamps
    end
  end
end
