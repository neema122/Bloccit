class SummariesController < ApplicationController
  def new
  end

  def create
    @summary = Summary.find(params[:topic_id])
      @summary.posts = @posts
  end

  def show
    @summary = Summary.find(params[:id])
        @posts = @summary.posts
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
