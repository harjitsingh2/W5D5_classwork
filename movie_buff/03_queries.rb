def what_was_that_one_with(those_actors)
  # Find the movies starring all `those_actors` (an array of actor names).
  # Show each movie's title and id.
    Movie.select("movies.id, movies.title")
        .joins(:actors)
        .where("actors.name IN (?)", those_actors) # movies with any of the actors
        .group("movies.id") # group by movie
        .having("COUNT(actors.id) = ?", those_actors.count) # count(?) is those_actors.length
end

def golden_age
  # Find the decade with the highest average movie score.
  # HINT: Use a movie's year to derive its decade. Remember that you can use
  # arithmetic expressions in SELECT clauses.
    Movie.select("(( movies.yr / 10) * 10) AS decade")
        .group("decade")
        .order("AVG(movies.score) DESC")
        .limit(1)
        # .pluck("decade")
        .first["decade"]
end

def costars(target_name)
  # List the names of the actors that the named actor has ever appeared with.
  # Hint: use a subquery
  movie_ids_with_person = Movie.joins(:actors)
  .where("actors.name = ?", target_name)
  .pluck("movies.id")

  Movie
  .joins(:actors)
  .where("movies.id IN (?) AND actors.name != ?", movie_ids_with_person, target_name)
  .select("DISTINCT actors.name")
  .pluck("actors.name")



end

def actor_out_of_work
  # Find the number of actors in the database who have not appeared in a movie.

end

def starring(whazzername)
  # Find the movies with an actor who had a name like `whazzername`. A name is
  # like whazzername if the actor's name contains all of the letters in
  # whazzername, ignoring case, in order.

  # E.g., "Sylvester Stallone" is like "sylvester" and "lester stone" but not
  # like "stallone sylvester" or "zylvester ztallone".

end

def longest_career
  # Find the 3 actors who had the longest careers (i.e., the greatest time
  # between first and last movie). Order by actor names. Show each actor's id,
  # name, and the length of their career.

end
