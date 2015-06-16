# TAFE, 29 April, 2015.
# Ruby Source File
# Activity::  Final Project: Quiz App
# Author::  041504258  Suruchi Bapat
# Author::  041502996  Dillon O'Dwyer

class QuizController < ApplicationController
  
  def index
  	require 'net/http'
  	require 'json'
  	
  	# The following line of code is to include the host URL to be able to get a result.
  	# A temporary HTTP result, created by the ASP.NET system and hardcoded, ids being used.
  	#session[:quizID] = params[:QuizID]
		#httpResult = Net::HTTP.get(URI.parse(''), '/students/ReturnQuiz?QuizID=' + session[:quizID])
		httpResult = '{"clustertitle": "Manage a Project Using Software Management Tools", "lecturer": "Nichola Kerr", "quiztitle": "Test Quiz", "timer": "120", "duedate": "24/05/2015 12:00:00 AM", "createdate": "18/05/2015 12:00:00 AM", "questions": [ ["TF", "TF Title", [["true", "t"]]], ["MC", "MC Title", [["incorrect", "f"], ["correct", "t"], ["incorrect", "f"], ["incorrect", "f"]]], ["MA", "MA Title", [["incorrectA", "f"], ["correctA", "t"], ["incorrectB", "f"], ["correctB", "t"]]], ["St", "St Title", [["", "t"]]], ["Lg", "Lg Title", [["", "t"]]]]}'
		
		jsonContent = JSON.parse(httpResult)
		
		session[:studentId] = jsonContent['studentid']
		@quizTitle = jsonContent['quiztitle']
		@lecturer = jsonContent['lecturer']
		@clusterTitle = jsonContent['clustertitle']
		session[:timer] = jsonContent['timer']
		@timer = session[:timer]
		@dueDate = Time.parse(jsonContent['duedate'])
		@createDate = Time.parse(jsonContent['createdate'])
		session[:takeDate] = Time.now
		
		session[:questions] = Array.new
		jsonContent["questions"].each do |question|
			answers = Array.new
			question[2].each do |answer|
				ansCorrect = false;
				if(answer[1] == 't')
					ansCorrect = true
				end
				answers.push(Answer.new(answer[0], ansCorrect))
			end
			session[:questions].push(Question.new(question[0], question[1], answers))
	end
	@total = session[:questions].count
	session[:current] = 0
  end

  def question
  	@total = session[:questions].count
	  @current = session[:current]
	 
		if @current >= @total
			redirect_to :action => "result"
			return
	 	end
	 
	 @question = session[:questions][@current]
	 @type = @question.getType
  end
  
  def answer
  	curQuestion = session[:questions][session[:current]]
  	if curQuestion.getType == 'TF'
  		tempAnsArr = Array.new
  		curQuestion.getAnswers.each do |tempAns|
  			if params[:tf] == tempAns.getText
  				tempAnsArr.push(Answer.new(tempAns.getText, true))
  			else
  			end
  		end
  		session[:questions][session[:current]].addAnswer(tempAnsArr)
  	elsif curQuestion.getType == 'MC'
  	  	tempAnsArr = Array.new
  	  	
  		curQuestion.getAnswers.each do |tempAns|
  			if params[:mc] == tempAns.getText
  				tempAnsArr.push(Answer.new(tempAns.getText, true))
  			else
  				tempAnsArr.push(Answer.new(tempAns.getText, false))
  			end
  		end
  		session[:questions][session[:current]].addAnswer(tempAnsArr)
  	elsif curQuestion.getType == 'MA'
  	  	tempAnsArr = Array.new
  		curQuestion.getAnswers.each do |tempAns|
  			if params[:ma]  == tempAns.getText
  				tempAnsArr.push(Answer.new(tempAns.getText, true))
  			else
  				tempAnsArr.push(Answer.new(tempAns.getText, false))
  			end
  		end
  		session[:questions][session[:current]].addAnswer(tempAnsArr)
  	elsif curQuestion.getType == 'St'
  	  	tempAnsArr = Array.new
  		curQuestion.getAnswers.each do |tempAns|
  			tempResponse = params[:st] ? tempAns.getText : nil
  			if tempResponse
  				tempAnsArr.push(Answer.new(params[:st], false))
  			end
  		end
  		session[:questions][session[:current]].addAnswer(tempAnsArr)
  	elsif curQuestion.getType == 'Lg'
  	  	tempAnsArr = Array.new
  		curQuestion.getAnswers.each do |tempAns|
  			tempResponse = params[:lg] ? tempAns.getText : nil
  			if tempResponse
  				tempAnsArr.push(Answer.new(params[:lg], false))
  			end
  		end
  		session[:questions][session[:current]].addAnswer(tempAnsArr)
  	else
  	
  	end
  	
  	session[:current] = session[:current] + 1
  	redirect_to :action => "question"
  end

  def result  
  	@questions = "\"questions\": ["
  	session[:questions].each do |ques|
  		@questions = @questions + ques.returnAnswers
  		if ques != session[:questions].last
  			@questions = @questions + ", "
  		end
  	end
  	@questions = @questions + "]"
  	puts(@questions)
  end

end
