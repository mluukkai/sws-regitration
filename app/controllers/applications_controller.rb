class ApplicationsController < ApplicationController
  before_action :set_application, only: [:show, :destroy]
  before_filter :allow_iframe_requests
  http_basic_authenticate_with name: ENV['USER'], password: ENV['PASSWORD'], only: [ :index, :destroy ]

  def index
    @applications = Application.all
  end

  def show
  end

  def new
    @application = Application.new
    if false # Rails.env.development?
      @application.firstname = "Pekka"
      @application.surename = "Mikkola"
      @application.street = "Erätie 3 a 34"
      @application.zip = "00700"
      @application.city = "helsinki"
      @application.email = "mluukkai@cs.helsinki.fi"
    end
  end

  def create
    @application = Application.new(application_params)

    if @application.save
      redirect_to @application, notice: "Jäsenhakemus lähetetty!<br><br> Lähetämme teille lisätietoja muutaman viikon kuluessa"
    else
      render :new 
    end
  end

  def destroy
    @application.destroy
    redirect_to applications_url, notice: 'Application was successfully destroyed.' 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_application
      @application = Application.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def application_params
      params.require(:application).permit(:firstname, :surename, :street, :zip, :city, :phone, :email, :born, :family)
    end

    def allow_iframe_requests
      response.headers.delete('X-Frame-Options')
    end    
end
