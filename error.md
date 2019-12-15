1) movies_with_directors_set when given a Hash with keys :name and :movies, returns an Array of Hashes that represent movies and each Hash has a :director_name key set with the value that was in :name correctly "distributes" Byron Poodleas :director_name of the first film
     Failure/Error:
       expect(results.first.first[:director_name]).to eq("Byron Poodle"),
         "The first element of the AoA should have 'Byron Poodle' as :director_name"

     TypeError:
       no implicit conversion of Symbol into Integer