class ColumnsController < ApplicationController

    def create
        @sheet = Sheet.find(params[:sheet_id])
        @column = @sheet.columns.create(column_params)
        
        redirect_to sheet_path(@sheet)
    end

    def edit
        @sheet = Sheet.find(params[:sheet_id])
        @column = @sheet.columns.find(params[:id])
        respond_to do |format|
            format.html
            format.turbo_stream
        end
    end

    def destroy
        @sheet = Sheet.find(params[:sheet_id])
        @column = @sheet.columns.find(params[:id])

        @column.destroy
        flash[:success] = "Destroyed Column Successfully"
        redirect_to Sheet.show
    end

    def update
        @sheet = Sheet.find(params[:sheet_id])
        @column = @sheet.columns.find(params[:id])
        respond_to do |format|
            if @column.update!(column_params)
                format.turbo_stream
            else
                format.html { render :edit, status: :unprocessable_entity }
            end
            redirect_to sheet_path(@sheet)
        end
        
    end

    private

    def column_params
        params.require(:column).permit(:title, :data_type)
    end
end
