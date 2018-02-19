class MaspDB < ActiveRecord::Base
    self.abstract_class = true
    establish_connection :database_masp
end
