class CreateWeathers < ActiveRecord::Migration[5.0]
  def change
    create_table :weathers do |t|
      t.string :search_term
      t.integer :count

      t.timestamps
    end
  end
end
