class CreateBets < ActiveRecord::Migration[7.1]
  def change
    create_table :bets do |t|
      t.references :user, null: false, foreign_key: true
      t.references :match, null: false, foreign_key: true
      t.integer :score_team_a, default: 0
      t.integer :score_team_b, default: 0
      t.references :winner, foreign_key: { to_table: :teams }
      t.integer :score, default: 0

      t.timestamps
    end
  end
end
