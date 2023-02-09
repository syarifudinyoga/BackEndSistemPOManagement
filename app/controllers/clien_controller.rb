class ClienController < ApplicationController
    skip_before_action :verify_authenticity_token

    def show
        @clien = Clien.all

        render json: @clien
    end

    def search
        @clien = Clien.search(params[:client_name])
    
        render json: @clien
    end

    def showByID
        @clien = Clien.find_by_clien_id(params[:id])
        
        render json: @clien
    end

    def clienParams
        params.permit(:client_name)
    end

    def add
        @clien = Clien.new(clienParams)
        
        if @clien.save
            render json: {
                message: "Success Add Data Clien",
            }, status: 200
        else
            render json: {
                message: "Failed Add Data Clien",
            }, status: 400
        end
    end

    def update
        @clien = Clien.find(params[:id])
        
        if @clien.update(clienParams)
            render json: {
                values: {},
                message: "Success Update Data Clien",
            }, status: 200
        else
            render json: {
            message: "Failed Update Data Clien",
            }, status: 400
        end
    end

    def delete
        @clien = Clien.find(params[:id])
        
        if @clien.destroy
            render json: {
                values: {},
                message: "Success Delete Data Clien",
            }, status: 200
        else
            render json: {
            message: "Failed Delete Data Clien",
            }, status: 400
        end
    end

    def allClient
        @clien = Clien.select(:clien_id).count
        
        render json: @clien
    end
end
