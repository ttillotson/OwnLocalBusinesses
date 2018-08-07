class BusinessesController < ApplicationController
    # Validation for Future Authentication
    before_action :require_signed_in

    def index 
        # Set Passed Values or Use Default
        @page = params['page'] ? params['page'].to_i : 1
        @per_page = params['per_page'] ? params['per_page'].to_i : 50

        page_offset = (@page - 1) * @per_page

        @prev_page = @page - 1 unless @page == 1
        @next_page = @page + 1 unless @page * @per_page >= Business.count
        @businesses = Business.limit(@per_page).offset(page_offset).order(:id)

        @errors = []
        # Ensure valid page length before page number.
        if @per_page < 1
            @errors << "Please select an amount greater than 0."
        elsif @per_page > 100
            @errors << "Please select an amount less than 100."
        elsif @page < 1 || @page * @per_page > Business.count
            @errors << "Please select a valid page."
        end

        if @errors.empty?  
            render :index, status: 200
        else
            @businesses = []
            render :index, status: 416
        end
    end

    def show
        @business = Business.find(params[:id])
        
        rescue ActiveRecord::RecordNotFound
            render json: ["This business was unable to be found. Please contact your administrator if you believe this is an error."], status: 404
    end

    # Private methods were intended to provide default values if passed
    # parameters outside of the range; error handling is taking care of this logic

    # private
    
    # def set_page
    #     page = params['page'].to_i
    #     # Page not given or invalidly small default first
    #     if page.nil? || page < 1
    #         return 1 
    #     end

    #     # If page given would exceed list, set to last page
    #     listings_count = Business.count
    #     if @per_page * page > listings_count
    #         page = listings_count / @per_page 
    #     end

    #     page
    # end

    # def set_count
    #     count = params['per_page'].to_i
    #     if count.nil? || count < 1 || count > 100
    #         return 50 
    #     end

    #     count
    # end
end
