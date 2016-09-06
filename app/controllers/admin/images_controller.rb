class Admin::ImagesController < ApplicationController
  def index
    @images = Image.all
  end

  def show
    @image = set_image
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)

    if @image.save
      flash[:notice] = 'Imagem salva com sucesso!'
      redirect_to admin_images_path
    else
      render 'new'
    end
  end

  def update
    @image = set_image
    if @image.update(image_params)
      flash[:notice] = 'Imagem alterada com sucesso!'
      redirect_to admin_images_path
    else
      render 'edit'
    end
  end

  def edit
    @image = set_image
  end

  def destroy
    @image = set_image
    @image.destroy if @image.present?
    redirect_to admin_images_path
  end

  private
    def set_image
      Image.find(params[:id])
    end

    def image_params
      params.require(:image).permit(:title, :description, :file)
    end
end
