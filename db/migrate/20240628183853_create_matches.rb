class CreateMatches < ActiveRecord::Migration[7.1]
  def change
    create_table :matches do |t|
      t.references :team_a, null: false, foreign_key: { to_table: :teams }
      t.references :team_b, null: false, foreign_key: { to_table: :teams }
      t.references :round, null: false, foreign_key: true

      t.timestamps
    end
  end
end
