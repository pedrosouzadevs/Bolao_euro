class CreateRounds < ActiveRecord::Migration[7.1]
  def change
    create_table :rounds do |t|
      t.string :stage

      t.timestamps
    end
  end
end
