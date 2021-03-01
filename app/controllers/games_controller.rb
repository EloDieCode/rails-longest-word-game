require "open-uri"

class GamesController < ApplicationController
  def new
    @letters = 10.times.map { [*'A'..'Z'].sample }.join
  end

  def score
    @grid = params[:letters].split("")
    @answer = params[:answer].upcase.split("")
    @included = included?(@answer, @grid)
    @english_word = english_word?(@answer)
  end

  private

  def included?(answer, letters)
    @answer.chars.all? { |letter| answer.count(letter) <= letters.count(letter) }
  end

  #   if @answer.all? do |letter|
  #     @grid.include? letter
  #     end
  #     puts "Congratulations, #{@answer} is an English valid word"
  #   else
  #     puts "Sorry but, #{@answer} can't be built out of #{@grid}"
  #   end
  # end


  def english_word?(word)
    response = open("https://wagon-dictionary.herokuapp.com/#{word}")
    @json = JSON.parse(response.read)
   json['found']
  end
end



# @answer.length + api

# -> vérifier si le mot est valide

# 1. The word can t be built out of the original grid
# 2. The word is valid according to the grid, but is not a valid English word
# 3. The word is valid according to the grid and is an English word
# (You can use this API to check if a word is valid.)
# "https://wagon-dictionary.herokuapp.com/:word". NOKOGIRI
