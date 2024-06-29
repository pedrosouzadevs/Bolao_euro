class CreateBetSecondRounds < ActiveRecord::Migration[7.1]
  def change
    create_table :bet_second_rounds do |t|
      t.references :match_1, null: false, foreign_key: true
      t.references :match_2, null: false, foreign_key: true
      t.references :match_3, null: false, foreign_key: true
      t.references :match_4, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
