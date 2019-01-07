require 'mechanize'
class UrlFunctions

  attr_accessor :number_of_server

  def initialize()
    # convert base_url into an object of mechanize and save the response into an instance variable
    @mechanize = Mechanize.new
    @full_stack_of_server = false
    @number_of_server
  end

  def set_url(base_url)
    @page = @mechanize.get(base_url)
    @mechanize_base_url = base_url
  end

  def set_url_and_get_page(base_url)
    newpage = @mechanize.get(base_url)
    return newpage
  end

  def check_header(page_link)
    header_value_x_made_on = "xyx"
    # look in header for value of key 'x-made-on' it says which webserver returns the currrent content
    page = set_url_and_get_page(page_link)
    header_x_made_on = 'x-made-on'
    header_key_x_made_on = page.header.key?(header_x_made_on)
    #check if this key exists on this page
    if (header_key_x_made_on)
      header_value_x_made_on = page[header_x_made_on]
      push_to_server_arr(header_value_x_made_on)
    else
      puts "There is no key '#{header_x_made_on}'"
      puts "Header all keys: #{page.header.keys}"
    end
    return header_value_x_made_on
  end

  def push_to_server_arr(value)
    #array to store servernames in it
    @stack_of_server ||= Array.new
    stack_of_server = @stack_of_server
    #end if all servers are found
    if (stack_of_server.size==number_of_server.to_i)
      @full_stack_of_server = true
    else
      #to prevent duplicate values
      if !stack_of_server.include?value
        stack_of_server << value
      end
    end
  end

  #check headers of linked pages
  def check_all_server
    # server_status = "server_status_default"
    # visited_server = Array.new
    # unique_visited_server = Array.new
    # value_false = 'false'
    #looking for all servers and check their status
    #looking for all elements 'a' with https part in url
    url_links = @page.links_with(:href => /https/)
    check_state_of_server(url_links)
    #puts "@page.methods:#{@page.methods}"
    #url_links = @page.at_css('.navigation--list-wrapper')
    #puts "url_links.class:#{url_links.class}"
  end

  def check_if_element_is_part_of_navi(page)
    #puts page
    #puts page.inspect
    #puts page.class
    #nav_elements = page.search('.navigation--list-wrapper').at('a')['href']
    #puts "p:#{nav_elements}"
    #page.each do |ele|
    #  puts ele.sssearch('.navigation--list-wrapper').at('a')['href']
    #end
    #page.search('//a').class # => Nokogiri::XML::NodeSet
    #noko_page = page.search("//a").map(&:class)
    #puts page.class
    #puts noko_page.inspect
    #doc.search("//a").map(&:class)
    #nokogiri_navi_path = page.search('.navigation--list-wrapper').each { |link| puts "nokogiri_links: #{link["href"]}" }
    #puts nokogiri_navi_path.class
    #nokogiri_navi_links = nokogiri_navi_path.map { |link| puts "nokogiri_links: #{link["href"]}" }
    #puts "Noko: #{nokogiri_navi_path}"
    #puts "NEW"
    #array_links = page.links_with(:href => /https/)
    #links_of_navi = url_links.search('.navigation--list-wrapper')
    #puts "links_of_navi:#{links_of_navi.class}"
    #array_links.each do |link|
      #puts "link:#{link.uri}"
    #   puts "link.methods:#{link.methods}"
    #end
    #puts "NOKO:#{noko_page.at('a')['.navigation--list-wrapper']}"
  end

  def check_state_of_server(url_links)
    #looking for all servers and check their status
    server_status ||= "server_status_default"
    visited_server ||= Array.new
    unique_visited_server ||= Array.new
    value_false ||= 'false'
    counter = 0
    #follow each link
    url_links.each do |link|
      # if @full_stack_of_server == true then break the loop
      if (@full_stack_of_server == false)
        # with help of regex look for the main part and the sub-part of the url to avoid the visit of an external url
        url_main = @page.uri.to_s
        url_path = link.uri.to_s
        if (url_path.include? url_main)
          #visit destination
          visited_server << visit_url(link)
          # check if server have a bad(false) status
          if (visited_server[counter].include?(value_false))
            #to prevent duplicate content (server) in array
            unless unique_visited_server.include?(visited_server[counter])
              unique_visited_server = unique_visited_server.push(visited_server[counter])
            end
            #failed_servers = "Error on #{visited_server[counter]}\n"
            failed_servers = "Error on #{unique_visited_server}\n"
            server_status << failed_servers
          else
            unless unique_visited_server.include?(visited_server[counter])
              unique_visited_server = unique_visited_server << (visited_server[counter])
            end
            server_status = "#{unique_visited_server.size}"# webservers are working
          end
          counter = counter + 1
        end
      end
    end
    # puts "checked urls: #{counter}"
    # if (server_status.to_i == 4)
    #   puts "checked all servers"
    # else
    #   puts "Have not checked all servers"
    # end
    return server_status
  end

  #links
  def get_all_links()
    # looking for all elements 'a' with https part in url
    url_links = @page.links_with(:href => /https/)
    counter = 0
    #follow each link
    url_links.each do |link|
      counter = counter + 1
      #visit destination
      visit_url(link)
    end
    puts "Es wurden #{counter} Seiten geprüft."
  end

  #visit url of link
  def visit_url(url)
    url_link = url
    begin
      linked_page = url_link.click
    rescue Exception => e
      puts "\033[37m#{e.inspect}\033[0m\n"
      linked_page = @page
    end
    #initialize vars for return
    server_status_delivery = true
    determined_server = "determined_server_default"
    server_status = "server_status_default"
    check_for_key = "page-wrap"
    determined_server = check_header(linked_page)
    # check if page contain something
    if linked_page.body.include?(check_for_key)
      server_status_delivery = get_status(linked_page)
    else
      raise ("page of #{linked_page.uri.to_s} do not include #{check_for_key}")
    end
    server_status = "#{determined_server}:#{server_status_delivery}"
    return server_status
  end

  def get_status(url)
    server_delivery_ok = true
    code1 = 100..102
    code2 = 200..226
    code3 = 300..308
    code4 = 400..449
    code5 = 500..511
    code9 = 900..999
    status_code = url.code.to_i
    puts "statuscode#{status_code}"
    case status_code
    when code1
      #puts "#{status_code} - Information"
      server_delivery_ok = false
    when code2
      #puts "#{status_code} - erfolgreiche Operation"
      server_delivery_ok = true
    when code3
      #puts "#{status_code} - Umleitung"
      server_delivery_ok = false
    when code4
      #puts "#{status_code} - Client Fehler"
      server_delivery_ok = false
    when code5
      #puts "#{status_code} - Server Fehler"
      server_delivery_ok = false
    when code9
      #puts "#{status_code} - 900er Fehler"
      server_delivery_ok = false
    else
      #puts "#{status_code} - unbekannter Fehler"
      server_delivery_ok = false
    end
    return server_delivery_ok
  end

  def get_status_code (url)
    page = @mechanize.get(url)
    status = page.code.to_i
    return status
  end
end
