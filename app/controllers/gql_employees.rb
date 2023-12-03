EmployeeApiPadrino::App.controllers :graphql_employees_controller, :map => '/graphql' do
  post :get_employee_by_id_gql, :map => 'getEmployeeByIdGQL' do
    puts "Employee Id in request: #{params[:emp_id]}"
    employee_id = params[:emp_id]
    query = <<~GRAPHQL
      query{
        employee(id: #{employee_id}){
          id
          employee_id
          first_name
          last_name
        }
      }
    GRAPHQL

    result = EmployeeApiPadrino::Schema.execute(
      query,
      context: {}
    )
  end
end
