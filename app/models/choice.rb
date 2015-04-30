# TAFE, 29 April, 2015.
# Ruby Source File
# Activity::  Final Project: Quiz App
# Author::  041504258  Suruchi Bapat

class Choice < ActiveRecord::Base
  belongs_to :question
end
