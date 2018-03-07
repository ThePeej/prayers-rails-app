class CreateUsergroups < ActiveRecord::Migration[5.1]
  def change
    create_table :usergroups do |t|
      t.integer :group_id
      t.integer :user_id

      t.timestamps
    end
  end
end
