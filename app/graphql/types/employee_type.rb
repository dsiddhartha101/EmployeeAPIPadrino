module Types

  class EmployeeType < GraphQL::Schema::Object
    field :id, ID, null: false
    field :employee_id, Integer, null: false
    field :first_name, String, null: true
    field :last_name, String, null: true
    field :email, String, null: true
    field :department, String, null: true
    field :position, String, null: true
    field :salary, Float, null: true
    field :hire_date, GraphQL::Types::ISO8601DateTime, null: true
    field :address, Types::AddressGQL, null: true
  end

  class AddressGQL < GraphQL::Schema::Object
    field :street, String, null: true
    field :city, String, null: true
    field :state, String, null: true
    field :zip_code, String, null: true
  end

  def employee(id:)
    Employee.where(employee_id: id)
  end
end