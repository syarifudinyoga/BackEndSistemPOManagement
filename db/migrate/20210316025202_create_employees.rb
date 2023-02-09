class CreateEmployees < ActiveRecord::Migration[6.1]
  def change
    create_table :employees do |t|
      t.string :nik
      t.string :name
      t.integer :clien_id      
      t.date :period_from
      t.date :period_to
      t.string :sow_att
      t.string :quotation_att
      t.string :po_att
      t.timestamps
    end
  end
end
