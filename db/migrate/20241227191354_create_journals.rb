class CreateJournals < ActiveRecord::Migration[8.0]
  def change
    create_table :journals do |t|
      t.string :text
      t.references :patient, foreign_key: true

      t.timestamps
    end
  end
end
