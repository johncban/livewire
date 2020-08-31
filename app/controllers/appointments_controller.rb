class AppointmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]



  def index
   @appointments = Appointment.all
  end

  def show
    #if @appointment.user_id == current_user.id 
    if @appointment.user_id == current_user.id 
       @appointment = Appointment.find(params[:id])
    else
       redirect_to root_path
    end
  end

  def new
    @appointment = Appointment.new
    @appointment.user_id = current_user.id 
  end

  def edit
    @appointment = Appointment.find(params[:id])
    @appointment.user_id = current_user.id 
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.user_id = current_user.id 
    respond_to do |format|
      if @appointment.save
        format.html { redirect_to @appointment, notice: 'Appointment was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    @appointment = Appointment.find(params[:id])
    @appointment.user_id = current_user.id 
    respond_to do |format|
      if @appointment.update(appointment_params)
        format.html { redirect_to @appointment, notice: 'Appointment was successfully updated.' }
        # use redirect_to dashboard or post path
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    #@appointment.user_id = current_user.id 
    @appointment.destroy
    respond_to do |format|
      format.html { redirect_to appointments_url, notice: 'Appointment was successfully destroyed.' }
    end
  end

  private

    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    def appointment_params
      params.require(:appointment).permit(:appt_name, :appt_description, :appt_date, :appt_address, :appt_city, :appt_state)
    end
end
