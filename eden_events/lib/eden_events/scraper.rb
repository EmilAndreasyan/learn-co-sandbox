class EdenEvents::Scraper
  def self.scrape_months
    doc = Nokogiri::HTML(open("https://www.edenproject.com/visit/whats-on?date_filter_type=month&date_filter_month=201910&date_filter_date%5Bdate%5D=&op=Show+selection&form_build_id=form-4JXex6smM4gzGwFkIzz-HBLG73SD9Zm_410m5NtJmB4&form_id=ep_t2_node_view_form"))
    months = doc.css("select#edit-date-filter-month")
    months.each do |m|
   name = m.text
   EdenEvents::Month.new(name)
  end
  end
  
end
