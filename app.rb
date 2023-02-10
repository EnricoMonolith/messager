require 'roda'
require 'pry'

class App < Roda
  plugin :render
  array=[]
  route do |r|
    r.root do
      r.get do
        render "secretinput"        
      end
    end
    r.on "password" do
      array = []
      array << r.params["password"]
      array << r.params["secret"]
      r.post do
        render "secretoutput"
      end
    end
    r.on "secret" do
      cpassword = r.params["cpassword"]
      if cpassword == array[0]
        render "secret", locals: {secret: array[1]}
      else
        render "error"
      end
    end
  end
end