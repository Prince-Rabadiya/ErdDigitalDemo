class StudentsController < ApplicationController
  def index
    redirect_to new_user_path unless session[:user_id].present?
    @students = params[:sort] == 'percentage' ? Student.all.order(percentage: params[:order]) : Student.all
    @order = params[:order]
    respond_to do |format|
      format.html
      format.js { render :update_table_data }
    end
  end

  def new
    @student = Student.new
  end

  def create
    student = Student.new(student_params)
    if student.save
      @students = Student.all
      @reset_form = true
    else
      @errors = student.errors.full_messages.join(', ').html_safe
    end
    render :update_table_data
  end

  def edit
  end

  def update
  end

  def destroy
    student = Student.find_by(id: params[:id])
    if student.destroy
      @students = Student.all
    else
      @errors = student.errors.full_messages.join(', ').html_safe
    end
    render :update_table_data
  end

  private

  def student_params
    params.require(:student).permit(:name, :image, :suba, :subb, :subc)
  end
end
