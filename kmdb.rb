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
# - Note rubric explanation for appropriate use of external resources.

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
# - You are welcome to use external resources for help with the assignment (including
#   colleagues, AI, internet search, etc). However, the solution you submit must
#   utilize the skills and strategies covered in class. Alternate solutions which
#   do not demonstrate an understanding of the approaches used in class will receive
#   significant deductions. Any concern should be raised with faculty prior to the due date.

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

# Represented by agent
# ====================
# Christian Bale

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
# TODO!
# 
Studio.destroy_all
Movie.destroy_all
Actor.destroy_all
Role.destroy_all
Agent.destroy_all

# Generate models and tables, according to the domain model.
# TODO!
# done using terminal commands outside of the .rb file

# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.
# TODO!
# 
#Studios
warnerbros = Studio.new
warnerbros["name"] = "Warner Bros."
warnerbros.save

# puts "There is #{Studio.all.count} studio."

# studio = Studio.find_by({"name" => "Warner Bros."})
# puts studio["name"]

# Movies
batman_begins = Movie.new
batman_begins.title = "Batman Begins"
batman_begins.year_released = 2005
batman_begins.rated = "PG-13"
batman_begins.studio_id = warnerbros.id
batman_begins.save

dark_knight = Movie.new
dark_knight.title = "The Dark Knight"
dark_knight.year_released = 2008
dark_knight.rated = "PG-13"
dark_knight.studio_id = warnerbros.id
dark_knight.save

knight_rises = Movie.new
knight_rises.title = "The Dark Knight Rises"
knight_rises.year_released = 2012
knight_rises.rated = "PG-13"
knight_rises.studio_id = warnerbros.id
knight_rises.save



# Batman Begins
# Actors

bale = Actor.new
bale.name = "Christian Bale"
bale.save

caine = Actor.new
caine.name = "Michael Caine"
caine.save

neeson = Actor.new
neeson.name = "Liam Neeson"
neeson.save

holmes = Actor.new
holmes.name = "Katie Holmes"
holmes.save

oldman = Actor.new
oldman.name = "Gary Oldman"
oldman.save

# roles
bb1 = Role.new
bb1.character_name = "Bruce Wayne"
bb1.actor_id = bale.id
bb1.movie_id = batman_begins.id 
bb1.save

bb2 = Role.new
bb2.character_name = "Alfred"
bb2.actor_id = caine.id
bb2.movie_id = batman_begins.id 
bb2.save

bb3 = Role.new
bb3.character_name = "Ra's Al Ghul"
bb3.actor_id = neeson.id
bb3.movie_id = batman_begins.id 
bb3.save

bb4 = Role.new
bb4.character_name = "Rachel Dawes"
bb4.actor_id = holmes.id
bb4.movie_id = batman_begins.id 
bb4.save

bb5 = Role.new
bb5.character_name = "Commissioner Gordon"
bb5.actor_id = oldman.id
bb5.movie_id = batman_begins.id 
bb5.save

# Dark Knight
# actors

ledger = Actor.new
ledger.name = "Heath Ledger"
ledger.save

eckhart = Actor.new
eckhart.name = "Aaron Eckhart"
eckhart.save

gyllenhaal = Actor.new
gyllenhaal.name = "Maggie Gyllenhaal"
gyllenhaal.save

# roles

dk1 = Role.new
dk1.character_name = "Bruce Wayne"
dk1.actor_id = bale.id
dk1.movie_id = dark_knight.id 
dk1.save

dk2 = Role.new
dk2.character_name = "Joker"
dk2.actor_id = ledger.id
dk2.movie_id = dark_knight.id 
dk2.save

dk3 = Role.new
dk3.character_name = "Harvey Dent"
dk3.actor_id = eckhart.id
dk3.movie_id = dark_knight.id 
dk3.save

dk4 = Role.new
dk4.character_name = "Alfred"
dk4.actor_id = caine.id
dk4.movie_id = dark_knight.id 
dk4.save

dk5 = Role.new
dk5.character_name = "Rachel Dawes"
dk5.actor_id = gyllenhaal.id
dk5.movie_id = dark_knight.id 
dk5.save

# Dark knight rises
# actors

hardy = Actor.new
hardy.name = "Tom Hardy"
hardy.save

gordon_levitt = Actor.new
gordon_levitt.name = "Joseph Gordon-Levitt"
gordon_levitt.save

hathaway = Actor.new
hathaway.name = "Anne Hathaway"
hathaway.save

# roles

dkr1 = Role.new
dkr1.character_name = "Bruce Wayne"
dkr1.actor_id = bale.id
dkr1.movie_id = knight_rises.id 
dkr1.save

dkr2 = Role.new
dkr2.character_name = "Commissioner Gordon"
dkr2.actor_id = oldman.id
dkr2.movie_id = knight_rises.id 
dkr2.save

dkr3 = Role.new
dkr3.character_name = "Bane"
dkr3.actor_id = hardy.id
dkr3.movie_id = knight_rises.id 
dkr3.save

dkr4 = Role.new
dkr4.character_name = "John Blake"
dkr4.actor_id = gordon_levitt.id
dkr4.movie_id = knight_rises.id 
dkr4.save

dkr5 = Role.new
dkr5.character_name = "Selina Kyle"
dkr5.actor_id = hathaway.id
dkr5.movie_id = knight_rises.id 
dkr5.save

# agents

ari_gold = Agent.new
ari_gold.name = "Ari Gold"
ari_gold.save

#agent represents
bale = Actor.find_by({"name" => "Christian Bale"})
bale.agent_id = ari_gold.id
bale.save


# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output.
# TODO!

for movie in Movie.all
  studio = Studio.find_by({"id" => movie.studio_id})
  puts "#{movie.title.ljust(22)} #{movie.year_released} #{movie.rated.ljust(7)} #{studio.name}"
end

# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!

for role in Role.all
  movie = Movie.find_by({"id" => role.movie_id})
  actor = Actor.find_by({"id" => role.actor_id})
  puts "#{movie.title.ljust(22)} #{actor.name.ljust(20)} #{role.character_name}"
end


# Prints a header for the agent's list of represented actors output
puts ""
puts "Represented by agent"
puts "===================="
puts ""

# Query the actor data and loop through the results to display the agent's list of represented actors output.
# TODO!

represented_actor = Actor.where.not({agent_id: nil})
for actor in represented_actor 
  agent = Agent.find_by({"id" => actor.agent_id})
  puts "#{actor.name}"
end