# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'open-uri'
require 'json'

url = 'http://tmdb.lewagon.com/movie/top_rated'

def fetch_movies(url)
  response = URI.open(url).read
  json = JSON.parse(response)
  return json['results']
end

movies = fetch_movies(url)

movies.each do |movie|
  title = movie['title']
  overview = movie['overview']
  rating = movie['vote_average']
  poster_url = "https://image.tmdb.org/t/p/original/#{movie['poster_path']}"

  Movie.create(
    title: title,
    overview: overview,
    rating: rating,
    poster_url: poster_url
  )
  puts "Created #{title}"
end
