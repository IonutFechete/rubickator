class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.string :name
      t.string :sex
      t.datetime :last_talk

      t.timestamps
    end
  end
end
