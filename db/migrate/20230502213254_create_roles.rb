class CreateRoles < ActiveRecord::Migration[7.0]
  def change
    create_table :roles do |t|
      #connect with movies and actors model
      t.integer"movie_id"
      t.integer"actor_id"
      #add character name
      t.string"character_name"

      t.timestamps
    end
  end
end
