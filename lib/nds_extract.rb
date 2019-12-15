# Provided, don't edit
require_relative './directors_database'
require 'pry'

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
  i = 0
  while i < movies_collection.length do
    movies_collection[i][:director_name] = name
    i += 1
  end
  movies_collection
end


def gross_per_studio(collection)
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
  all_studio_hash
end

def movies_with_directors_set(source)
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
      m += 1
    end
    d += 1
  end
  results
end

# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds) 
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end