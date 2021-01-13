class PrescriptionsController < ApplicationController
  def index
    @prescriptions = Prescription.all
  end

  def show
    @prescription = Prescription.find(params[:id])
  end

  def new
    @prescription = Prescription.new
  end

  def create
    @prescription = Prescription.new(prescription_params)
    
    if @prescription.save
      redirect_to @prescription
      flash[:notice] = "Prescription successfully created!"
    else
      render :new
    end
  end

  def destroy
    @prescription = Prescription.find(params[:id])
    @prescription.destroy
    redirect_to prescriptions_path
    flash[:notice] = "Prescription deleted."
  end

  private

  def prescription_params
    params.require(:prescription).permit(:name)
  end
end
