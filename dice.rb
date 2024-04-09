require "better_errors"
require "binding_of_caller"

class DiceApp < Sinatra::Base
configure :development do
  use BetterErros::Middleware
  BetterErrors.application_root = __dir__
end


#need this for better_errors 

use(BetterErrors::Middleware)
BetterErrors.application_root=__dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0./0.0.0.0.')







require "sinatra"

get("/zebra") do
  "We must add a route for each path we want to support"
end

require "sinatra/reloader"

get ("/giraffe") do
  "Hopefully this shows up without having to restart the server"
end



get("/dice/2/10") do
  first_die = rand(1..10)
  second_die = rand(1..10)
  sum = first_die + second_die 

  outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."

  "<h1>2d10<h1>
  <p>#{outcome}</p>"

end
