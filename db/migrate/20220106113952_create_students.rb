class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.string :name
      t.string :image
      t.integer :suba
      t.integer :subb
      t.integer :subc
      t.integer :percentage

      t.timestamps
    end
  end
end
