class ListsController < ApplicationController
  before_action :set_list, only: [:edit, :show, :update]

  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def show
    @movies = Movie.all
    @bookmarks = Bookmark.where(list_id: @list)
  end

  def edit
  end

  def create
    @list = List.new(list_params)
    @list.save
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end

  def set_list
    @list = List.find(params[:id])
  end
end
