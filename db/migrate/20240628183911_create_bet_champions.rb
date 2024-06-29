class CreateBetChampions < ActiveRecord::Migration[7.1]
  def change
    create_table :bet_champions do |t|
      t.references :team, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
