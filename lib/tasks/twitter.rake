task(:scrape) do
  p "Lets scrape Senate Twitters!"
  p "Ready...Set...Go"

  browser = Ferrum::Browser.new(browser_options: { 'no-sandbox': nil })
  browser.goto("https://www.senate.gov/senators/contact")
  #browser.screenshot(path: "google.png")
  links = browser.css("div.contenttext a")

  link = links.at(1)

  contact_url = link.attribute(:href)

    p "Visting #{contact_url}..."
    browser.goto(contact_url)
    
    senator_page_links = browser.css("a")
   
  #links.each_with_index do |link, index|
    #if index.odd?
     #contact_url = link.attribute(:href)

     #p  "Visting #{contact_url}..."
     #browser.goto(contact_url)
     #p browser.css("a").count
     #browser.back
    #end
  #end
end