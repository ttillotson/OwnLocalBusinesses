json.set! :page, @page
json.set! :per_page, @per_page
json.set! :prev_page, @prev_page
json.set! :next_page, @next_page

json.businesses do 
    json.array! @businesses.pluck(:id)
end