require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:home)
end

get("/square/result") do

  @number = params.fetch("number").to_i

  @result = @number * @number.to_f

  erb(:square)

end

get("/square/new") do 

  erb(:home)

end

get("/square_root/new") do

  erb(:sqrt_new)

end

get("/square_root/result") do

  @number = params.fetch("number").to_i

  @result = Math.sqrt(@number) * 1.0

  erb(:sqrt)

end
