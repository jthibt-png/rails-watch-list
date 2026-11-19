class CreateSignets < ActiveRecord::Migration[8.1]
  def change
    create_table :signets do |t|
      t.text :comment

      t.timestamps
    end
  end
end
