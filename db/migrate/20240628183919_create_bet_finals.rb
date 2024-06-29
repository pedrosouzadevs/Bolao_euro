class CreateBetFinals < ActiveRecord::Migration[7.1]
  def change
    create_table :bet_finals do |t|
      t.references :match, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
