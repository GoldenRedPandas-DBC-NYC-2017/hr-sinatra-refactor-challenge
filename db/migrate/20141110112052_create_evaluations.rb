class CreateEvaluations < ActiveRecord::Migration[5.0]
  def change
    create_table :evaluations do |t|
      t.belongs_to :position
      t.text :summary
      t.boolean :probation
    end
  end
end
