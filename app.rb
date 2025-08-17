require "sinatra"
require "sinatra/reloader"
require "active_support/all"

get("/") do
  erb(:home)
end

get("/square/result") do

  @number = params.fetch("number").to_f

  @result = @number * @number

  erb(:square)

end

get("/square/new") do 

  erb(:home)

end

get("/square_root/new") do

  erb(:sqrt_new)

end

get("/square_root/result") do
#maybe put round to get the float zero out or something idk
  #@number = params.fetch("number").to_f.to_fs(:percentage, {:precision => 0})
  @number = params.fetch("number").to_f

  @result = Math.sqrt(@number)

  erb(:sqrt)

end

get("/payment/new") do
  erb(:payment_new)
end

get("/payment/result") do

  @apr = params.fetch("apr").to_f.to_fs(:percentage, {:precision => 4})
  @years = params.fetch("years").to_i

  @principal = params.fetch("principal").to_f

  @r = @apr.to_f/ 100 / 12

  @n = 12 * @years

  @numerator = @r * @principal

  @denominator = 1 - (1 + @r) ** -@n

  @payment = @numerator / @denominator

  @principal = @principal.to_fs(:currency)

  @payment = @payment.to_f.to_fs(:currency)

  erb(:payment)
end


get("/random/new") do

  erb(:random_new)

end

get("/random/result") do

  @min = params.fetch("min").to_f
  @max = params.fetch("max").to_f

  @result = rand(@min..@max)

  erb(:random)
end
