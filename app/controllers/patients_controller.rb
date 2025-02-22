class PatientsController < ApplicationController

    before_action :set_patient, only: [:show, :edit, :update, :destroy]

    def index 
        @patients = Patient.all
    end

    def show
    end

    def new 
        @patient = Patient.new
    end

    def create
        @patient = Patient.new(patient_params)
        
        if @patient.save
            redirect_to patient_path(@patient)
        else
            render :new
        end
    end

    def edit
    end

    def update
        @patient.update(patient_params)
        if @patient.save
            redirect_to patient_path(@patient)
        else 
            render :edit
        end
    end

    def destroy
        @patient.destroy
        redirect_to patient_path
    end

    private 

    def set_patient
        @patient = Patient.find(params[:id])
    end

    def patient_params
        params.require(:patient).permit(:name)
    end

end
