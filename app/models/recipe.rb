class Recipe
  include HTTParty
 # default_options.update(verify: false) # Turn off SSL verification

  ENV['FOOD2FORK_KEY'] = 'your API KEY'
  hostport = ENV['FOOD2FORK_SERVER_AND_PORT'] || 'www.food2fork.com'
  base_uri "http://#{hostport}/api"
  default_params key: ENV['FOOD2FORK_KEY']

  def self.for term
    get("/search", query: { q: term })["recipes"]
  end

end
