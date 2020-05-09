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
    
    senator_page_links = browser.css('[href*="twitter.com"]')

    senator_handles= Array.new

    senator_page_links.each do |link|
      if link.attribute(:href).exclude?("/status/")
      senator_handles.push(link.attribute(:href))
      end
    end

   

    #senator_page_links.each do |sp_link|
      #if sp_link.text.strip == "Twitter"
       # p sp_link.attribute(:href)
     # end
    #end
   
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