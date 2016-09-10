class Panel::ImagesController < Panel::ApplicationController
  before_action :correct_user, only: [:show, :update, :edit, :destroy]

  add_breadcrumb 'Imagens', :panel_images_path

  def index
    @images = Image.where(user_id: current_user.id).page(params[:page])
  end

  def show
  end

  def new
    add_breadcrumb 'Nova'
    @image = Image.new
  end

  def create
    add_breadcrumb 'Nova'
    @image = Image.new(image_params)
    @image.user_id = current_user.id

    if @image.save
      flash[:notice] = 'Imagem salva com sucesso!'
      redirect_to panel_images_path
    else
      render 'new'
    end
  end

  def update
    add_breadcrumb 'Editar'
    if @image.update(image_params)
      flash[:notice] = 'Imagem alterada com sucesso!'
      redirect_to panel_images_path
    else
      render 'edit'
    end
  end

  def edit
    add_breadcrumb 'Editar'
  end

  def destroy
    @image.destroy
    flash[:notice] = 'Imagem excluída com sucesso!'
    redirect_to panel_images_path
  end

  private

    def correct_user
      @image = Image.find_by(id: params[:id], user_id: current_user.id)
      if @image.nil?
        flash[:error] = 'Você não possui autorização para acessar esse recurso.'
        redirect_to panel_root_path
      end
    end

    def image_params
      params.require(:image).permit(:title, :description, :file)
    end
end
