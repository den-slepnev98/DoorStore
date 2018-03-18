class OrdersController < ApplicationController
  before_filter :ensure_admin!, only: [:index, :destroy]

  def index
    @orders = Order.all
  end

  def create
    @door = Door.find(params[:id])
    @order = @door.orders.create(order_params(@door))

    if @order.save
      flash[:success] = 'Замовлення прийнято!'
      redirect_to doors_path
    else
      render 'doors/show'
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    redirect_to orders_path
  end

  private

  def order_params(door)
    unless params[:order].has_key?(:material_id)
      params[:order][:material_id] = door.material_id
    end
    params.require(:order).permit(:width, :height, :door_opening, :comment,
                                  :material_id, :user_name, :user_phone, :user_email)
  end

end
