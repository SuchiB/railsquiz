# TAFE, 06 June, 2015.
# Ruby Source File
# Activity::  Final Project: Quiz App
# Author:: 041502996 Dillon O'Dwyer

class Answer
  def initialize(text, correct)
     @text = text
     @correct = correct
  end
  
  def getText
    return @text
  end
  
  def getCorrect
    return @correct
  end
end
