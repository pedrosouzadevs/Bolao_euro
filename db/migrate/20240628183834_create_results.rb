class CreateResults < ActiveRecord::Migration[7.1]
  def change
    create_table :results do |t|
      t.integer :score_team_a, default: 0
      t.integer :score_team_b, default: 0
      t.boolean :penalty, default: false
      t.references :match, null: false, foreign_key: true
      t.references :team_a, null: false, foreign_key: { to_table: :teams }
      t.references :team_b, null: false, foreign_key: { to_table: :teams }
      t.references :winner, null: false, foreign_key: { to_table: :teams }
      t.timestamps
    end
  end
end
