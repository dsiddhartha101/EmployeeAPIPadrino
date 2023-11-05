# MongoMapper.connection = Mongo::Client.new('localhost', 27017)

db_name = 'personal_learning_dev'
db_host = 'localhost'
db_port = 27017
MongoMapper.connection = Mongo::Client.new(["#{db_host}:#{db_port}"], database: db_name)

case Padrino.env
  when :development then MongoMapper.database = db_name
  when :production  then MongoMapper.database = db_name
  when :test        then MongoMapper.database = db_name
end