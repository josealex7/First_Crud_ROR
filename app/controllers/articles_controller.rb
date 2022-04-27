class ArticlesController < ApplicationController

  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def show
    #debbuger
    #Esta linea busca de la tabla Article el id que se coloco en la ruta
    #y guarda los valores de ese id en la variable de instancia @article
    #de esta manera la podemos usar en las views
  end

  def index
    #Guarda todos los registros de Article en la variable de instancia @articles
    @articles  = Article.all
  end

  def new
    #Crea un nuevo articulo vacio y lo guarda en la variable de instancia @article
    @article =Article.new
  end

  def edit
    #Busca el articulo que tenga el id que este en la ruta y lo guarda en la variable de instancia @article
  end

  def create
    #Crea un registro en Article con el titulo y descripción, y lo guarda en la variable de instancia @article
    @article = Article.new(article_params)
    #Guarda article en la base de datos, si funciona ingresa al if de lo contrario ingresa al else
    if @article.save
      #Muestra un mensaje en la pantalla 
      flash[:notice] = "Article was creted succesfully"
      #Redirige a show 
      redirect_to @article
    else
      #En caso de que no guarde muestra los errores que se presentaron
      render :new, status: :unprocessable_entity
    end
  end

  def update
    #Crea un registro en Article con el titulo y descripción, y lo guarda en la variable de instancia @article
    #Guarda article en la base de datos, si funciona ingresa al if de lo contrario ingresa al else
    if @article.update(article_params)
      #Muestra un mensaje en la pantalla
      flash[:notice] = "Article was update successfully"
      #Redirige a show 
      redirect_to @article
    else
      #En caso de que no guarde muestra los errores que se presentaron
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private 
  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end

end