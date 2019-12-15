# Provided, don't edit
require_relative './directors_database'
require 'pry'

# A method we're giving you. This "flattens"  Arrays of Arrays so: [[1,2],
# [3,4,5], [6]] => [1,2,3,4,5,6].

def flatten_a_o_a(aoa)
  result = []
  i = 0

  while i < aoa.length do
    k = 0
    while k < aoa[i].length do
      result << aoa[i][k]
      k += 1
    end
    i += 1
  end

  result
end

def movie_with_director_name(director_name, movie_data)
  { 
    :title => movie_data[:title],
    :worldwide_gross => movie_data[:worldwide_gross],
    :release_year => movie_data[:release_year],
    :studio => movie_data[:studio],
    :director_name => director_name
  }
end


# Your code after this point

def movies_with_director_key(name, movies_collection)
  # GOAL: For each Hash in an Array (movies_collection), provide a collection
  # of movies and a directors name to the movie_with_director_name method
  # and accumulate the returned Array of movies into a new Array that's
  # returned by this method.
  #
  # INPUT:
  # * name: A director's name
  # * movies_collection: An Array of Hashes where each Hash represents a movie
  #
  # RETURN:
  #
  # Array of Hashes where each Hash represents a movie; however, they should all have a
  # :director_name key. This addition can be done by using the provided
  # movie_with_director_name method
  i = 0
  while i < movies_collection.length do
    movies_collection[i][:director_name] = name
    i += 1
  end
  movies_collection
end


def gross_per_studio(collection)
  # GOAL: Given an Array of Hashes where each Hash represents a movie,
  # return a Hash that includes the total worldwide_gross of all the movies from
  # each studio.
  #
  # INPUT:
  # * collection: Array of Hashes where each Hash where each Hash represents a movie
  #
  # RETURN:
  #
  # Hash whose keys are the studio names and whose values are the sum
  # total of all the worldwide_gross numbers for every movie in the input Hash
  all_studio_hash = {}
  m = 0
  while m < collection.length do
    if !all_studio_hash[collection[m][:studio]]
      all_studio_hash[collection[m][:studio]] = collection[m][:worldwide_gross]
    else
      all_studio_hash[collection[m][:studio]] += collection[m][:worldwide_gross]
    end
    m += 1
  end
  # binding.pry
  all_studio_hash
end

def movies_with_directors_set(source)
  # GOAL: For each director, find their :movies Array and stick it in a new Array
  #
  # INPUT:
  # * source: An Array of Hashes containing director information including
  # :name and :movies
  # [
  #   {
  #     :name=>"Byron Poodle",
  #     :movies=>
  #     [
  #       {
  #         :title=>"At the park"
  #       }, 
  #       {
  #         :title=>"On the couch"
  #       }
  #     ]
  #   },
  #   {
  #     :name=>"Nancy Drew",
  #     :movies=>
  #       [
  #         {:title=>"Biting"}
  #       ]
  #   }
  # ]
  #
  # RETURN:
  #
  # Array of Arrays containing all of a director's movies. Each movie will need
  # to have a :director_name key added to it.
  # { :name => "A", :movies => [{ :title => "Test" }] }
  # becomes... [
                  # [{:title => "Test", :director_name => "A"}],
                  # ...[],
                  # ... []]
  
  results = []
  d = 0
  while d < source.length do
    m = 0
    while m < source[d][:movies].length
      inner_hash = {}
      inner_array = []
      inner_hash[:title] = source[d][:movies][m][:title]
      inner_hash[:director_name] = source[d][:name]
      inner_array << inner_hash
      results << inner_array
      # binding.pry
      m += 1
    end
    d += 1
  end
  # binding.pry
  results
end

# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds) #returns [ [{:title => "Test", :director_name => "A"}], [] ]
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names) #[[1,2],[3,4,5], [6]] => [1,2,3,4,5,6]
  binding.pry
  return gross_per_studio(movies_with_director_names) 
  # binding.pry
end