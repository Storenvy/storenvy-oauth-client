class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :storenvy_uid
      t.string :storenvy_access_token

      t.timestamps
    end
  end
end
