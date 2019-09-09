class CreateDiesels < ActiveRecord::Migration[6.0]
  def change
    create_table :diesels do |t|
      t.float :price
      t.float :diffrence

      t.timestamps
    end
  end
end
