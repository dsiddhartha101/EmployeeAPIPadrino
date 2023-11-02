EmployeeApiPadrino::App.controllers :employees_controller, :map => 'api' do

  get '/example' do
    'Hello world!'
  end

  controller :get_employees_rendered, :map => 'renderedEmployees' do
    get :all_employees_rendered, :provides => :json, :map => 'getAllEmployees' do
      @employees = Employee.all # TODO - add limit to the number of Employees being fetched
      render 'employees/getAllEmployees'
    end
  end

  controller :get_employees, :map => 'employees' do

    get :all_employees, :provides => :json, :map => 'getAllEmployees' do
      @employees = Employee.all
      @employees.to_json
    end

    get :get_employee_by_id, :with => :emp_id, :provides => :json, :map => 'getEmployeeById' do
      param_emp_id = params[:emp_id].to_i
      @employee = Employee.where(employee_id: param_emp_id)
      if @employee
        @employee.to_json
        puts "Employee: #{@employee.to_json}"
      else
        status 404  # HTTP status code for "Not Found"
        { error: 'Employee not found' }.to_json
      end
    end

    # get :index, :map => '/foo/bar' do
    #   session[:foo] = 'bar'
    #   render 'index'
    # end
    #
    # get :sample, :map => '/sample/url', :provides => [:any, :js] do
    #   case content_type
    #     when :js then ...
    #     else ...
    # end
    #
    # get :foo, :with => :id do
    #   "Maps to url '/foo/#{params[:id]}'"
    # end

  end

end
