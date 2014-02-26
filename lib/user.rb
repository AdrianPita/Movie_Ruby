class User
    attr_accessor :comments, :favorite_movies


    def initialize
        @comments = []
        @favorite_movies = []
    end
    def new_comment (title, comment)
        user_comment = {}
        user_comment["Title"] = title
        user_comment["Comment"] = comment
        @comments << user_comment
    end
    def get_comments 
        @comments
    end

    def favorite_a_movie (movie_title)
        @favorite_movies << movie_title
    end
end