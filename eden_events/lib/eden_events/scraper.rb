class EdenEvents::Scraper
  def scrapre_month
    doc = Nokogiri::HTML(open("https://www.edenproject.com/visit/whats-on"))
  end
end