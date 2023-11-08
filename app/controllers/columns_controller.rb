class ColumnsController < ApplicationController

    def create
        @sheet = Sheet.find(params[:sheet_id])
        @column = @sheet.columns.create(column_params)
        redirect_to sheet_path(@sheet)
    end

    def column_params
        params.require(:column).permit(:title, :data_type)
    end
end
