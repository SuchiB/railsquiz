# TAFE, 29 April, 2015.
# Ruby Source File
# Activity::  Final Project: Quiz App
# Author::  041504258  Suruchi Bapat

module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = "Ruby on Rails Quiz App"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
end
