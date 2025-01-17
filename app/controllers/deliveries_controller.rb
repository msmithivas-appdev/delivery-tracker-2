class DeliveriesController < ApplicationController
  def index
    matching_deliveries = Delivery.all

    @list_of_deliveries = matching_deliveries.order({ :created_at => :desc })

    render({ :template => "deliveries/index2.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_deliveries = Delivery.where({ :id => the_id })

    @the_delivery = matching_deliveries.at(0)

    render({ :template => "deliveries/show.html.erb" })
  end

  def create
    the_delivery = Delivery.new
    the_delivery.description = params.fetch("query_description")
    the_delivery.arrival_date = params.fetch("query_supposed_to_arrive_on")
    # the_delivery.carrier = params.fetch("query_carrier")
    # the_delivery.tracking_number = params.fetch("query_tracking_number")
    the_delivery.user_id = session.fetch(:user_id)
    the_delivery.status = params.fetch("query_details")

    if the_delivery.valid?
      the_delivery.save
      redirect_to("/deliveries", { :notice => "Delivery created successfully." })
    else
      redirect_to("/deliveries", { :alert => the_delivery.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_delivery = Delivery.where({ :id => the_id }).at(0)

    the_delivery.description = params.fetch("query_description")
    the_delivery.arrival_date = params.fetch("query_arrival_date")
    the_delivery.carrier = params.fetch("query_carrier")
    the_delivery.tracking_number = params.fetch("query_tracking_number")
    the_delivery.user_id = params.fetch("query_user_id")
    the_delivery.status = params.fetch("query_status")

    if the_delivery.valid?
      the_delivery.save
      redirect_to("/deliveries/#{the_delivery.id}", { :notice => "Delivery updated successfully."} )
    else
      redirect_to("/deliveries/#{the_delivery.id}", { :alert => the_delivery.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_delivery = Delivery.where({ :id => the_id }).at(0)

    the_delivery.destroy

    redirect_to("/deliveries", { :notice => "Delivery deleted successfully."} )
  end
end
