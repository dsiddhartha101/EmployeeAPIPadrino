EmployeeApiPadrino::App.controllers :employees_controller, :map => "/api" do

  get '/test' do
    'Hello world!'
  end

  controller :get_employees_rendered, :map => 'renderedEmployees' do
    get :all_employees_rendered, :provides => :json, :map => 'getAllEmployees' do
      @employees = Employee.all
      render 'employees/getAllEmployees'
    end

    get :all_employees_by_limit_rendered, :with => :emp_limit, :map => 'getAllEmployeesByLimit' do
      default_limit = 3
      @limit = params[:emp_limit].to_i || default_limit
      @employees = Employee.limit(@limit) # TODO - add limit to the number of Employees being fetched
      render 'employees/getAllEmployeesByLimit'
    end

    get :all_employees_by_range_rendered, :map => 'getAllEmployeesByRange' do
      default_upper_limit = 3
      @lower_limit = params[:lower_limit].to_i || 0
      @upper_limit = params[:upper_limit].to_i || default_upper_limit
      @employees = Employee.where(:employee_id.gte => @lower_limit, :employee_id.lte => @upper_limit) # TODO - add limit to the number of Employees being fetched
      render 'employees/getAllEmployeesByRange' # can pass arg obj like :arg_ame => {...}
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
      else
        status 404  # HTTP status code for "Not Found"
        { error: 'Employee not found' }.to_json
      end
    end

    get :get_active_employees, :provides => :json, :map => 'getActiveEmployees' do
      @employees = Employee.all
      @employees.reject! { |emp| !emp.deactivated.nil? && emp.deactivated }
      @employees.to_json
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
