class ListsController < ApplicationController

  def new
    @lists = List.all
  end
end
