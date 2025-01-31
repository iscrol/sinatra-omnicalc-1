require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:homepage)
end

get("/square/new") do
  erb(:square)
end

get("/square/results") do
  @num = params.fetch("num", nil).to_f
  @result = @num ** 2
  erb(:square_results)
end

get("/square_root/new") do
  erb(:square_root)
end

get("/square_root/results") do
  @num = params.fetch("num").to_f
  @result = Math.sqrt(@num)
  erb(:square_root_results)
end

get("/random/new") do
  erb(:random)
end

get("/random/results") do
  @min = params.fetch("min").to_f
  @max = params.fetch("max").to_f
  @result = rand(@min..@max)
  erb(:random_results)
end

get("/payment/new") do
  erb(:payment)
end

get("/payment/results") do
  @apr = params.fetch("apr").to_f
  @num_years = params.fetch("num_years").to_i
  @principal = params.fetch("principal").to_f

  r = @apr / 100 / 12
  n = @num_years * 12
  top = r * @principal
  bottom = 1 - (1 + r) ** -n

  @apr = @apr.to_fs(:percentage, {:precision => 4})
  @principal = @principal.to_fs(:currency)
  @result = (top / bottom).to_fs(:currency)
  erb(:payment_results)
end
