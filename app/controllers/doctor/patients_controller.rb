class Doctor::PatientsController < Doctor::BaseController

  def destroy
    patient_doctor_relation = PatientsDoctor.find_by(doctor_id: params[:doctor_id], patient_id: params[:id])
    patient_doctor_relation.destroy
    redirect_to doctor_path(params[:doctor_id])
  end

end
