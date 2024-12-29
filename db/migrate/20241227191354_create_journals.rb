class CreateJournals < ActiveRecord::Migration[8.0]
  def change
    create_table :journals do |t|
      t.string :text
      t.belongs_to :patient_id

      t.timestamps
    end
  end
end
