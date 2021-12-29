class Public::WordsController < ApplicationController
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
    @word = Word.new(word_params)
    if @word.save
      redirect_to root_path, notice: '新規作成しました'
    else
      render :new
    end
  end

  private
    def word_params
      params.require(:word).permit(:body)
    end
end