# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.

Studio.destroy_all
Movie.destroy_all
Actor.destroy_all
Role.destroy_all

# Generate models and tables, according to the domain model.
# # generated Movie, Studio, Actor, Role models and movies.rb, studios.rb, actors.rb, roles.rb tables in terminal using rails generate model and rails db:migrate commands

# Insert data into the database that reflects the sample data shown above.
#do not use hard-coded foreign IDs
#insert warner bros studio row 
studio = Studio.new
studio["name"] = "Warner Bros."
studio.save 
#create variable specific to warner bros studio
warnerbros = Studio.find_by({"name" => "Warner Bros."})

#add each of the 3 batman movies as rows in the table 
batman = Movie.new
batman["title"]= "Batman Begins"
batman["year_released"]= 2005
batman["rated"] = "PG-13"
batman["studio_id"] = warnerbros["id"]
batman.save

batman = Movie.new
batman["title"]= "The Dark Knight"
batman["year_released"]= 2008
batman["rated"] = "PG-13"
batman["studio_id"] = warnerbros["id"]
batman.save

batman = Movie.new
batman["title"] = "The Dark Knight Rises"
batman["year_released"] = 2012
batman["rated"] = "PG-13"
batman["studio_id"] = warnerbros["id"]
batman.save

#add variable name for each batman to reference in roles
batman1 = Movie.find_by({"title" => "Batman Begins"})
batman2 = Movie.find_by({"title" => "The Dark Knight"})
batman3 = Movie.find_by({"title" => "The Dark Knight Rises"})

#add in variables and information for batman begins actors 
bale = Actor.new
bale["name"] = "Christian Bale"
bale.save

caine = Actor.new
caine["name"] = "Michael Caine"
caine.save
caine = Actor.find_by({"name" => "Michael Caine"})

neeson = Actor.new
neeson["name"] = "Liam Neeson"
neeson.save

holmes = Actor.new
holmes["name"] = "Katie Holmes"
holmes.save

oldman = Actor.new
oldman["name"] = "Gary Oldman"
oldman.save

#add batman begin roles
wayne = Role.new
wayne["character_name"] = "Bruce Wayne"
wayne["movie_id"] = batman1["id"]
wayne["actor_id"] = bale["id"]
wayne.save

alfred = Role.new
alfred["character_name"] = "Alfred"
alfred["movie_id"] = batman1["id"]
alfred["actor_id"] = caine["id"]
alfred.save

ras = Role.new
ras["character_name"] = "Ra's Al Ghul"
ras["movie_id"] = batman1["id"]
ras["actor_id"] = neeson["id"]
ras.save

rachel= Role.new
rachel["character_name"] = "Rachel Dawes"
rachel["movie_id"] = batman1["id"]
rachel["actor_id"] = holmes["id"]
rachel.save

commissioner = Role.new
commissioner["character_name"] = "Commissioner Gordon"
commissioner["movie_id"] = batman1["id"]
commissioner["actor_id"] = oldman["id"]
commissioner.save


# add actors and roles rows for The Dark Knight
ledger = Actor.new 
ledger["name"] = "Heath Ledger"
ledger.save

eckhart = Actor.new
eckhart["name"] = "Aaron Eckhart"
eckhart.save

gyllenhaal = Actor.new
gyllenhaal["name"] = "Maggie Gyllenhaal"
gyllenhaal.save

wayne2 = Role.new
wayne2["character_name"] = "Bruce Wayne"
wayne2["movie_id"] = batman2["id"]
wayne2["actor_id"] = bale["id"]
wayne2.save

joker = Role.new
joker["character_name"] = "Joker"
joker["movie_id"] = batman2["id"]
joker["actor_id"] = ledger["id"]
joker.save

harvey = Role.new
harvey["character_name"] = "Harvey Dent"
harvey["movie_id"] = batman2["id"]
harvey["actor_id"] = eckhart["id"]
harvey.save

alfred2 = Role.new
alfred2["character_name"] = "Alfred"
alfred2["movie_id"] = batman2["id"]
alfred2["actor_id"] = caine["id"]
alfred2.save

rachel2 = Role.new
rachel2["character_name"] = "Rachel Dawes"
rachel2["movie_id"] = batman2["id"]
rachel2["actor_id"] = gyllenhaal["id"]
rachel2.save

# add actors and roles rows for the dark knight rises

hardy = Actor.new
hardy["name"] = "Tom Hardy"
hardy.save

gordonlevitt = Actor.new
gordonlevitt["name"] = "Josheph Gordon-Levitt"
gordonlevitt.save

hathaway = Actor.new
hathaway["name"] = "Anne Hathaway"
hathaway.save

wayne3 = Role.new
wayne3["character_name"]= "Bruce Wayne"
wayne3["movie_id"] = batman3["id"]
wayne3["actor_id"] = bale["id"]
wayne3.save

commissioner3 = Role.new
commissioner3["character_name"] = "Commissioner Gordon"
commissioner3["movie_id"] = batman3["id"]
commissioner3["actor_id"] = oldman["id"]
commissioner3.save

bane = Role.new
bane["character_name"] = "Bane"
bane["movie_id"] = batman3["id"]
bane["actor_id"] = hardy["id"]
bane.save

john = Role.new
john["character_name"] = "John Blake"
john["movie_id"] = batman3["id"]
john["actor_id"] = gordonlevitt["id"]
john.save

selina = Role.new
selina["character_name"] = "Selina Kyle"
selina["movie_id"] = batman3["id"]
selina["actor_id"] = hathaway["id"]
selina.save


# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""


# Query the movies data and loop through the results to display the movies output.
# Query movies data
batmanmovies = Movie.all

for batman in batmanmovies
    #query to find the studio for each movie 
    studio = Studio.find_by({"id" => batman["studio_id"]})
    #read each movie title, year, and rated
    movie_title = batman["title"]
    movie_year_released = batman["year_released"]
    movie_rating = batman["rated"]
    movie_studio = studio["name"]
    # display movie title, year and rating
    puts "#{movie_title} #{movie_year_released} #{movie_rating} #{movie_studio}"
end

# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.
leading_actors = Role.all
#puts leading_actors.inspect

for actor in leading_actors
    # query to find movie and studio for each actor/cast member 
    movieid = Movie.find_by({"id" => actor["movie_id"]})
    actorid = Actor.find_by({"id" => actor["actor_id"]})
    #read each movie and corresponding actors names, character name
    movie_name = movieid ["title"]
    actor_name =  actorid["name"]
    character_name = actor["character_name"]
    #display title, actor name and character name
    puts "#{movie_name} #{actor_name} #{character_name}"
end

