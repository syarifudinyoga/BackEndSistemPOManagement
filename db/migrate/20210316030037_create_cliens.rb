class CreateCliens < ActiveRecord::Migration[6.1]
  def change
    create_table :cliens do |t|
      t.string :client_name
      t.timestamps
    end
  end
end
