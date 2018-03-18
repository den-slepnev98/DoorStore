class DoorsController < ApplicationController
  before_filter :ensure_admin!, except: [:index, :show]

  def index
    @materials = Material.all
    @doors = Door.search(search_params)
                 .paginate(per_page: 10, page: params[:page])
  end

  def show
    @door = Door.find(params[:id])
  end

  def new
    @materials = Material.all
    @door = Door.new
  end

  def create
    unless params[:door][:photo].nil?
      params[:door][:photo] = upload_image(params[:door][:photo], 'doors')
    end

    @materials = Material.all
    @material = Material.find(params[:material_id])
    @door = @material.doors.create(door_params)

    if @door.save
      redirect_to doors_path
    else
      render 'new'
    end
  end

  def edit
    @materials = Material.all
    @door = Door.find(params[:id])
  end

  def update
    @materials = Material.all
    unless params[:door][:photo].nil?
      params[:door][:photo] = upload_image(params[:door][:photo], 'doors')
    end

    @door = Door.find(params[:id])
    @door.material = Material.find(params[:material_id])

    if @door.update(door_params)
      redirect_to doors_path
    else
      render 'edit'
    end
  end

  def destroy
    @door = Door.find(params[:id])
    @door.destroy

    redirect_to doors_path
  end

  private
  def door_params
    params.require(:door).permit(:name, :description, :min_price, :width,
                                 :height, :photo)
  end

  def search_params
    if params[:search]
      params.require(:search).permit(:price, materials: [])
    end
  end
end
