class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :product, foreign: true
      t.references :user, foreign: true
      t.text :description
      t.integer :rating

      t.timestamps null: false
    end
  end
end
