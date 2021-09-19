class Admin::CustomersController < ApplicationController

  def index
    @customers = Customer.all
  end

  def show
  end

  def edit
  end

  def updated
  end

end
