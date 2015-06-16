# TAFE, 29 April, 2015.
# Ruby Source File
# Activity::  Final Project: Quiz App
# Author::   041502996 Dillon O'Dwyer

class Question
  def initialize(type, text, q_answers)
    @text = text
  	@type = type
    @q_answers = q_answers
  	@s_answers
  end
  
  def getText
     return @text
  end
  
  def getType
     return @type
  end
  
  def getAnswers
     return @q_answers
  end
  
  def getStudsAns
    return @s_answers
  end

  def addAnswer(s_answers)
    @s_answers = s_answers
  end
  
  def returnAnswers
  	@returnString = "[\"" + @type + "\", \"" + @text + "\", ["
  	@s_answers.each do |answer|
  		tempCor = answer.getCorrect
  		  if tempCor
  		    tempCor = 't'
  		  else
  		    tempCor = 'f'
  		  end
  		tempTxt = answer.getText
  		@returnString = @returnString + "[\"" + tempTxt + "\", \"" + tempCor + "\"]"
  		if answer != @s_answers.last
  		  @returnString = @returnString + ", "
  		end
  	end
  	@returnString = @returnString + "]]"
  	return @returnString
  end
end
