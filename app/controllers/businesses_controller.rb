class BusinessesController < ApplicationController
    def index 
        # @page = params['page'] ? params['page'].to_i : 1
        # @per_page = params['per_page'] ? params['per_page'].to_i : 50
        @per_page = set_count 
        @page = set_page

        page_offset = (@page - 1) * @per_page

        @prev_page = @page - 1 unless @page == 1
        @next_page = @page + 1 unless @page * @per_page >= Business.count
        @businesses = Business.limit(@per_page).offset(page_offset).order(:id)
    end

    def show
        @business = Business.find(params[:id])

        render :show
    end

    private
    
    def set_page
        page = params['page'].to_i
        # Page not given or invalidly small default first
        if page.nil? || page < 1
            return 1 
        end

        # If page given would exceed list, set to last page
        listings_count = Business.count
        if @per_page * page > listings_count
            page = listings_count / @per_page 
        end

        page
    end

    def set_count
        count = params['per_page'].to_i
        if count.nil? || count < 1 || count > 100
            return 50 
        end

        count
    end
end
