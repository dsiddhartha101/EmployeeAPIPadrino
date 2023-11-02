# MongoMapper.connection = Mongo::Client.new('localhost', 27017)
MongoMapper.connection = Mongo::Client.new(['localhost:27017'], database: 'personal_learning_dev')
case Padrino.env
  when :development then MongoMapper.database = 'personal_learning_dev'
  when :production  then MongoMapper.database = 'personal_learning_dev'
  when :test        then MongoMapper.database = 'personal_learning_dev'
end