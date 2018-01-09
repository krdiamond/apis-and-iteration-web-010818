require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character)
  #make the web request
  character_hash = take_from_web('http://www.swapi.co/api/people/')
  movies_array = nil
  character_hash["results"].each do |result|
      if result["name"].downcase == character
          movies_array = result["films"]
      end
  end

  movies_info_array = []
  movies_array.each do |movie_url|
      movies_info_array << take_from_web(movie_url)
  end
  movies_info_array
end



  # iterate over the character hash to find the collection of `films` for the given
  #   `character`
  
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  
  # this collection will be the argument given to `parse_character_movies`
  #  and that method will do some nice presentation stuff: puts out a list
  #  of movies by title. play around with puts out other info about a given film.

def take_from_web(url)
    all_string = RestClient.get(url)
    info_hash = JSON.parse(all_string)
    info_hash
end


#def get_character_movies_from_api(character)
#    all_characters = RestClient.get('http://www.swapi.co/api/people/')
#    character_hash = JSON.parse(all_characters)
#    movies_array = nil
#    character_hash["results"].each do |result|
#        if result["name"] == character
#            movies_array = result["films"]
#        end
#    end
#    movies_info_array = []
#    movies_array.each do |movie_url|
#        movie_info = RestClient.get(movie_url)
#        movie_info_hash = JSON.parse(movie_info)
#        movies_info_array << movie_info_hash
#    end
#    movies_info_array
#end



def parse_character_movies(films_hash)
    films_hash.each do |film|
        puts film["title"]
    end
  # some iteration magic and puts out the movies in a nice list
end


def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)
  parse_character_movies(films_hash)
end


## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
