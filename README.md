# Hacker News "Who's Hiring?" Job Post Scraper
Scrapes the monthly "who's hiring" post from Hacker News and saves the posts that contain a specified location and skill (i.e. San Francisco and Rails).

## Requirements & Getting Started

This script requires Ruby 2.1.0 or higher to run. It uses [Nokogiri] and [ReverseMarkdown].

```
gem install nokogiri
gem install reverse_markdown
```

Change the variables to specify which post you want to scrape, what city and job skill you're looking for, and the month for the post. By default, it's July 2017's post, 'San Francisco, CA', and 'Rails'.

### Running & Output

In the terminal type:

```
ruby hn_scraper.rb
```

Example terminal output:

```
There are 4 number of jobs matching the description.
```

A Markdown file will be created in the same directory with the results (i.e. hn_july_jobs.md).


[Nokogiri]: https://github.com/sparklemotion/nokogiri
[ReverseMarkdown]: https://github.com/xijo/reverse_markdown
