class Customer::MembersController < ApplicationController

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    @customer.update(member_params)
    redirect_to members_path
  end

  def unsubscribe

  end

  def withdraw
    @customer = current_customer
    @customer.update(is_active: false)
    redirect_to root_path
  end

  private

  def member_params
    params.require(:customer).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,:email,:postal_code,:address,:telephone_number)
  end


end
