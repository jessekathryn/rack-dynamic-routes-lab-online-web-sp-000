#require 'pry'

class Application 
  
def call(env)
  resp = Rack::Response.new
  req = Rack::Request.new(env)
 
    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      
      if item =@@items.find{|i| i.name == item_name}
        resp.write item.price
      elsif item =@@items.find{|i| i.name != item_name}
        resp.write "Item not found"
        resp.status = 400
       end
     else req.path!="/items/"
        resp.write "Route not found"
        resp.status = 404 
    end
   resp.finish
  end
end