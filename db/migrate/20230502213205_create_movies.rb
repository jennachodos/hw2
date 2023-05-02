class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
       #add variables
       t.string "title"
       t.integer "year_released"
       t.string "rated"
       #add studio ID to link studio to movie 
       t.integer "studio_id"
       
      t.timestamps
    end
  end
end
