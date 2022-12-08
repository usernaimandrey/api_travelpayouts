class CreateBanes < ActiveRecord::Migration[6.1]
  def change
    create_table :banes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :program, null: false, foreign_key: true

      t.timestamps
    end
  end
end
