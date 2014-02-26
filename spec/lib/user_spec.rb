require "rspec"
require 'users'

user = User.new
comments = [{"Title" => "Toy", "Comment" => "Awesome movie!"}]

describe "When a user comments" do
  
  it "contains the comment info" do
    user.new_comment "Toy", "Awesome movie!"
    expect(user.get_comments).to eq comments
  end

  it "contains all the comments info" do
    user.new_comment "Gladiator", "My favorite movie"
    comments << { "Title" => "Gladiator", "Comment" => "My favorite movie"}
    expect(user.get_comments).to eq comments
  end
end

describe "When a user favorites a movie" do
  it "the movie is favorited for that user" do
    user.favorite_a_movie("Toy")
    expect(user.favorite_movies).to eq ["Toy"]
  end
end