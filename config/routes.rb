Bladerunner::Engine.routes.draw do
  get "/test" => "application#test", as: :test
  get "/run" => "application#run", as: :run
  root to: "application#index"
end
