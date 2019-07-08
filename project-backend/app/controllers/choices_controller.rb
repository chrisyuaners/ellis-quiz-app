class ChoicesController < ApplicationController
  def index
    choices = Choice.all
    render json: choices
  end
end
