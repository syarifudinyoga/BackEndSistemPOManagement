class EmployeeController < ApplicationController
    skip_before_action :verify_authenticity_token

    def show
        @employee = Employee.joins('INNER JOIN cliens ON cliens.clien_id = employees.clien_id').select('*')
        render json: @employee
    end

    def search
        @employee = Employee.search(params[:nik_name])
    
        render json: @employee
    end

    def showByID
        @employee = Employee.find_by_id(params[:id])
        
        render json: @employee
           
    end

    def employeeParams
        params.permit(:nik, :name, :clien_id, :period_from, :period_to, :sow_att, :quotation_att, :po_att,)
    end

    def add
        @employee = Employee.new(employeeParams)
        if @employee.save
            render json: {
                message: "Success Add Data Employee",
            }, status: 200
        else
            render json: {
                message: "Failed Add Data Employee",
            }, status: 400
        end
    end

    def update
        @employee = Employee.find(params[:id])
        
        if @employee.update(employeeParams)
            #render json: {
            #    message: "Success Update Data Employee",
            #}, status: 200
        else
            #render json: {
            #message: "Failed Update Data Employee",
            #}, status: 400
        end
    end

    def delete
        @employee = Employee.find(params[:id])
        
        if @employee.destroy
            render json: {
                message: "Success Delete Data Employee",
            }, status: 200
        else
            render json: {
            message: "Failed Delete Data Employee",
            }, status: 400
        end
    end

    def allEmployee
        @employee = Employee.select(:id).count
        
        render json: @employee
    end

    def countAllEmployeeWork
        @employee = Employee.where("DATE(period_to) >= ?", Date.today).count
        
        render json: @employee
    end
end