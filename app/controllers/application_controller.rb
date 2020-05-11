class ApplicationController < ActionController::Base
  include ApplicationHelper
  helper :all
  helper ApplicationHelper
end
