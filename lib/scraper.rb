require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './course.rb'

class Scraper 
  
  def print_courses
    self.make_courses
    Course.all.each do |course|
      if course.title && course.title != ""
        puts "Title: #{course.title}"
        puts "  Schedule: #{course.schedule}"
        puts "  Description: #{course.description}"
      end
    end
  end
  
  def get_page
    Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
  end
  
  def get_courses
    get_page.css('#course-grid > section > article')
  end 
 
  def make_courses
        get_courses.map do |cours|
          course = Course.new
          course.title = cours.css("h2").text
          course.schedule = cours.css("em").text
          course.description = cours.css("p").text
        end
    
  end
  
  
end



