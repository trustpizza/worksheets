class CreateColumns < ActiveRecord::Migration[7.1]
  def change
    create_table :columns do |t|
      t.string :title
      t.string :data_type
      t.references :sheet, null: false, foreign_key: true

      t.timestamps
    end
  end
end
