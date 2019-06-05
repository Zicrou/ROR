class WordsController < ApplicationController

http_basic_authenticate_with name: "zicrou", password: "Zicrou", except: [:index, :show]	
	def index
		@words = Word.all
	end

	def show
		@word = Word.find(params[:id])
	end
	
	def new
		@word = Word.new
	end
	
	def edit
		@word = Word.find(params[:id])
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

	def update
		 @word = Word.find(params[:id])
 
		 if @word.update(kholalma_word)
		   redirect_to @word
		 else
		   render 'edit'
		  end
	end

	def destroy
  		@word = Word.find(params[:id])
  		@word.destroy
 
  		redirect_to words_path
	end

	private
		def kholalma_word
			params.require(:word).permit(:nature, :word, :exemple)
		end
end

