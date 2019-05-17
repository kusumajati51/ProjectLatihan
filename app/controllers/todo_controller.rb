class TodoController < ApplicationController

    before_action :authorize_access_request!
    before_action :set_todo, only: [ :update, :show, :destory]

    def index
        @todo = current_user.todos

        render json: @todo
    end
    private

    def set_todo
        @todo = current_user.todos.find(params[:id])
    end

    def todo_params
        param.require(:todo).permit(:title)
    end
end
