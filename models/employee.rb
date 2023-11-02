class Employee
  include MongoMapper::Document

  set_collection_name "employees"
  # key <name>, <type>
  key :employee_id, Integer
  key :first_name, String
  key :last_name, String
  key :email, String
  key :department, String
  key :position, String
  key :salary, Integer
  key :hire_date, Date
  key :address, Hash

  timestamps!
end
