class CreatePrayers < ActiveRecord::Migration[5.1]
  def change
    create_table :prayers do |t|
      t.text :details

      t.timestamps
    end
  end
end
