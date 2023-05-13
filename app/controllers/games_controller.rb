require "open-uri"

class GamesController < ApplicationController

  def new
    @letters = []
    alphabet = ("A".."Z").to_a
    10.times do
      @letters << alphabet[rand(alphabet.length-1)]
    end
    @letters
  end

  def score
    # raise
    # cas 1: les lettres du mot n'appartiennent pas à la grille

    word = params[:word]
    letters = params[:letters]
    url = "https://wagon-dictionary.herokuapp.com/#{word}"
    dictionary = JSON.parse(URI.open(url).read)

    if word.split("").all? { |letter| letters.include?(letter) }
      @answer = "Sorry but #{word} can't be built out of #{letters}"
    elsif
      dictionary["found"] == false
      @answer = "Sorry but #{word} does not seem to be a valid English word"
    else
      @answer = "Congratulations! #{word} is a valid English word"
    end

    # url = // https://wagon-dictionary.herokuapp.com/
    # dictionary = JSON.parse(URI.open(url).read)
    # if

    # cas 2 : le mot n'est pas un mot anglais valide
    # || dictionary.!include?(word)
    # false
  end

end
