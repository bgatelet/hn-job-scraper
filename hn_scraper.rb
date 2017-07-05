#! /usr/bin/env ruby
# Author: Brice Gatelet (bgatelet@gmail.com)

require 'nokogiri'
require 'open-uri'
require 'reverse_markdown'

# Variables to change hacker news posting, location, job skills, and month (used for file name).
hn_url = "https://news.ycombinator.com/item?id=14688684"
city = "San Francisco, CA"
skill = "Rails"
month = "july"


# Fetch and parse HTML document.
doc = Nokogiri::HTML(open(hn_url), nil, 'UTF-8')

number_of_jobs = 0

open("hn_#{month}_jobs.md", 'w') { |f|
  doc.css('div.comment').each do |link|

    # Find the content for a specific location and skill.
    if link.content.match( /#{city}/i ) && link.content.match( /#{skill}/i )

      # Remove the hacker news 'reply' link from each post.
      link.css('div.reply').remove

      # Turn the first line of the post into an H3. The first line is the basic job information.
      header = link.css('span.c00').first
      header.inner_html = "### #{header.inner_html}"

      # Convert HTML to markdown for readability.
      f.puts ReverseMarkdown.convert link.to_html
      # Adds two horizontal lines to separate each job posting.
      2.times { f.puts '***' }

      number_of_jobs += 1
    end
  end
}

puts "There are #{number_of_jobs} number of jobs matching the description."
