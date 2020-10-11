class AppointmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_appointment, only: %i[show edit update destroy]

  def index
    if current_user.id == user_id_num
      @appointments = User.find(user_id_num).appointments
    else
      flash[:error] = "UNAUTHORIZED ACCESS: Other User's Appointment is Private."
      redirect_to root_path
    end
  end

  def show
    find_appointment
    if @appointment.user_id == current_user.id
      address_results = Geocoder.search([@appointment.locations.first.latitude, @appointment.locations.first.longitude])
      @county = address_results.first.county
      @state = @appointment.locations.first.appt_state
      if @county.nil?
        flash[:warning] = "Covid 19 Data at #{@state} Boroughs Are Not Available!"
      else
        covidCountyData
      end
    else
      flash[:error] = 'Record Access is Restricted.'
      redirect_to user_appointments_path
    end
  end

  def new
    find_by_appointment
    @appointment = Appointment.new
    @appointment.user_id = current_user.id
    @appointment.locations.build
  end

  def create
    @appointment = current_user.appointments.new(appointment_params)
    @appointment.locations.first.user_id = current_user.id
    @appointment.user_id = current_user.id
    respond_to do |format|
      if @appointment.save
        format.html { redirect_to user_appointments_path, notice: 'Appointment was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    find_appointment
  end

  def update
    find_appointment
    if @appointment.update(appointment_params)
      redirect_to user_appointments_path(current_user), notice: 'Appointment was successfully updated.'
    else
      render 'edit'
    end
  end

  def destroy
    find_by_appointment
    @appointment.destroy
    respond_to do |format|
      format.html { redirect_to user_appointments_path, notice: 'Appointment was successfully destroyed.' }
    end
  end

  def covidCountyData
    url = URI('https://covid19-us-api.herokuapp.com/county')

    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Post.new(url)
    request.body = "{\n    \"state\": \"#{@state}\",\n    \"county\": \"#{@county.gsub('County', '').strip}\"\n}"

    response = https.request(request)

    c19raw = response.read_body
    cd19 = JSON.parse(c19raw)

    @confirmed_case = cd19['message'][0]['confirmed']
    @new_case = cd19['message'][0]['new']
    @death = cd19['message'][0]['death']
    @new_death = cd19['message'][0]['new_death']
    @fatality = cd19['message'][0]['fatality_rate']
    @last_update = cd19['message'][0]['last_update']

    p cd19
  end

  private

  def find_by_appointment
    @user = User.find_by(params[:user_id])
  end

  def find_appointment
    @appointment = Appointment.find(id_num)
  end

  def user_id_num
    params[:user_id].to_i
  end

  def id_num
    params[:id].to_i
  end

  def set_appointment
    @appointment = Appointment.find_by_id(id_num)
    if @appointment.nil?
      flash[:error] = 'The Appointment You Search Do Not Exist from the Database'
      redirect_to user_appointments_path
    end
  end

  def appointment_params
    params.require(:appointment).permit(:id, :appt_name, :appt_description, :appt_date,
                                        locations_attributes: %i[
                                          id
                                          appt_address
                                          appt_city
                                          appt_state
                                        ])
  end
end
