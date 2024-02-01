class VariablesController < ApplicationController
  def index
    user = DevCycle::User.new({ user_id: 'user_id_example' })
    @variables = DevCycleClient.all_variables(user)
  end
end
