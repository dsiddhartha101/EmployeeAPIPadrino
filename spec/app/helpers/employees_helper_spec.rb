require 'spec_helper'

RSpec.describe "EmployeeApiPadrino::App::EmployeesHelper" do
  pending "add some examples to (or delete) #{__FILE__}" do
    let(:helpers){ Class.new }
    before { helpers.extend EmployeeApiPadrino::App::EmployeesHelper }
    subject { helpers }

    it "should return nil" do
      expect(subject.foo).to be_nil
    end
  end
end
