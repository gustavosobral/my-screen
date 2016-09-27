module Panel
  class ImagesController < Panel::ApplicationController
    add_breadcrumb 'Imagens', :panel_images_path

    def index
      @images = current_user.images.page(params[:page])
    end

    def new
      add_breadcrumb 'Nova'
      @image = current_user.images.new
    end

    def edit
      add_breadcrumb 'Editar'
      @image = set_image
    end

    def create
      add_breadcrumb 'Nova'
      @image = current_user.images.new(image_params)

      if @image.save
        flash[:notice] = 'Imagem salva com sucesso!'
        redirect_to panel_images_path
      else
        render 'new'
      end
    end

    def update
      add_breadcrumb 'Editar'
      @image = set_image

      if @image.update(image_params)
        flash[:notice] = 'Imagem alterada com sucesso!'
        redirect_to panel_images_path
      else
        render 'edit'
      end
    end

    def destroy
      @image = set_image
      @image.destroy
      flash[:notice] = 'Imagem excluída com sucesso!'
      redirect_to panel_images_path
    end

    private

    def set_image
      current_user.images.find(params[:id])
    end

    def image_params
      params.require(:image).permit(:title, :description, :file)
    end
  end
end
