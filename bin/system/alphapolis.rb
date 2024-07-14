# frozen_string_literal: true
require 'net/http'
require 'nokogiri'
require 'json'

module Alphapolis
  class App
    def initialize data=nil
      @writer_id = nil
      @book_id = nil

      unless data.nil?
        unless data[:writer_id].nil?
          @writer_id = data[:writer_id]
        end

        unless data[:book_id].nil?
          @book_id = data[:book_id]
        end
      end
    end

    def download writer_id=@writer_id, book_id=@book_id
      # Error
      if writer_id.nil? && book_id.nil?
        if @writer_id.nil? || @book_id.nil?
          puts "[Error] Please input writer_id and book_id code 1"
          exit 1
        end

      elsif @writer_id.nil? && @book_id.nil?
        if writer_id.nil? || book_id.nil?
          puts "[Error] Please input writer_id and book_id code 2"
          exit 1
        end
      end


      puts "[INFO] Writer ID: #{writer_id}"
      puts "[INFO] Book ID: #{book_id}"

      # Main
      book_url = "https://www.alphapolis.co.jp/novel/#{writer_id}/#{book_id}"
      puts "[INFO] Book URL: #{book_url}"

      # Get First book url
      uri = URI.parse(book_url)

      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true

      request = Net::HTTP::Get.new(uri)
      response = http.request(request)

      if response.code == '404' # Error
        puts "[Error] This book is not found."
        exit 1
      else # Main

        content_html_str = response.body
        content_html = Nokogiri.HTML5(content_html_str)

        title_element = content_html.css(
          "h1.title"
        )

        if title_element.length == 0
          puts "[Error] No title found."
          exit 1
        end

        title = title_element[0].text
        puts "[INFO] Book_title: #{title}"

        urls = content_html.css(
          ".episode a"
        )

        if urls.length == 0
          puts "[Error] No urls found."
        end

        length = urls.length
        no = 1
        text = ""

        urls.each do |url_element|
          url = url_element["href"]
          puts "[LOG]  Downloading... #{url} (#{no}/#{length})"
          uri = URI.parse(url)

          http = Net::HTTP.new(uri.host, uri.port)
          http.use_ssl = true

          request = Net::HTTP::Get.new(uri)
          request['User-Agent'] = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36 Edg/126.0.0.0'
          request['Referer'] = book_url
          request['Cookie'] = '_gcl_au=1'

          response = http.request(request)

          if response.code == '404'
            puts "[Error] Response code is 404."
          end

          episode_html_str = response.body

          episode_html = Nokogiri.HTML5(episode_html_str)

          text += "\n\n-- Episode: #{no}\n\n"
          episode_text = episode_html.css(
            "#novelBody"
          )

          if episode_text.length == 0
            puts "[Error] No episode text."
            exit 1
          end

          text += episode_text[0].text

          no += 1
        end

        File.open(path="#{title}.txt", mode="w") do |file|
          file.write(text)
        end
      end
    end
  end
end