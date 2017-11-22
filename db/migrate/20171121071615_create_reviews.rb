class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.references :movie, foreign_key: true
      t.references :user, foreign_key: true
      t.text :comment
      t.integer :rating

      t.timestamps
    end
  end
end
