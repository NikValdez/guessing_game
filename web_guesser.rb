require 'sinatra'
require 'sinatra/reloader'

NUMBER = rand(100)


get '/' do
  guess = params['guess'].to_i
  message, background = check_guess(guess)
  erb :index, :locals => {:number => NUMBER, :message => message, :background => background}
end

def check_guess(guess)
  if guess - NUMBER > 5
    ["Way too high!", 'red']
  elsif guess > NUMBER
    ["Too high!", 'OrangeRed']
  elsif NUMBER - guess > 5
    ["Way too low!", 'red']
  elsif guess < NUMBER
    ["Too low!", 'OrangeRed']
  elsif guess == NUMBER
    ["Good job! The secret number is #{guess}", 'green']
  end
end