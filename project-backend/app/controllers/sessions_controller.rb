class SessionsController < ApplicationController
  def index
    sessions = Session.all
    render json: SessionSerializer.new(sessions).to_serialized_json
  end

  def create
    new_session = Session.create(session_params)
    render json: new_session
  end

  def show
    session = Session.find(params[:id])
    render json: SessionSerializer.new(session).to_serialized_json
  end

  def update
    session = Session.find(params[:id])
    session.update(session_params)
    render json: session
  end

  private

  def session_params
    params.require(:session).permit(:user_id, :right, :wrong)
  end
end
