class CreateDogWalkings < ActiveRecord::Migration[6.0]
  def change
    create_table :dog_walkings do |t|
      t.integer :status
      t.datetime :scheduled_date
      t.float :price
      t.integer :duration
      t.float :latitude
      t.float :longitude
      t.integer :pets
      t.time :begins
      t.time :ends

      t.timestamps
    end
  end
end