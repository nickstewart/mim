class PrescriptionsController < ApplicationController

  def index
    @prescriptions = Prescription.all
  end

  def show
    @prescription = Prescription.find(params[:id])
  end
  
  def edit
    @prescription = Prescription.find(params[:id])
  end

  def new
    @prescription = Prescription.new
  end

  def create
    @prescription = Prescription.new(prescription_params)
    if @prescription.save
      redirect_to @prescription, notice: "Prescription created"
    else
      render :new
    end
  end

  def update
    @prescription = Prescription.find(params[:id])
    if @prescription.update(prescription_params)
      redirect_to @prescription, notice: "Your changes have been saved"
    else
      render :edit
    end
  end

  def destroy
    @prescription = Prescription.find(params[:id])
    @prescription.destroy
    redirect_to prescriptions_path, alert: "Prescription deleted"
  end

  private

  def prescription_params
    params.require(:prescription).permit(:name)
  end
end

