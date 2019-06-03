class WordsController < ApplicationController
	
	def index
		@words = Word.all
	end

	def show
		@word = Word.find(params[:id])
	end
	
	def new
		@word = Word.new
	end

	def create
		#render plain: params[:word].inspect
		
		#Getting data without saytou
		#@word = Word.new(params[:word])
		
		#With Saytou
		@word = Word.new(kholalma_word)

		if @word.save
			redirect_to @word
		else
			render 'new'
		end
	end

	private
		def kholalma_word
			params.require(:word).permit(:nature, :word, :exemple)
		end
end

