class CreateHistories < ActiveRecord::Migration[5.0]
  def change
    create_table :histories do |t|
      t.integer :principal
      t.integer :partner

      t.timestamps
    end
  end
end
