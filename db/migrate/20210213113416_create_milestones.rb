class CreateMilestones < ActiveRecord::Migration[6.0]
  def change
    create_table :milestones do |t|
      t.string :title
      t.text :description
      t.boolean :completed
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
