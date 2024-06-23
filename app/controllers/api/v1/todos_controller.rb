module Api
  module V1
    class TodosController < ApplicationController
      before_action :set_todo, only:[:update, :destroy]
      def create
        todo = Todo.new(todo_params)
        todo.post_id = params[:post_id]
        if todo.save
          render json: { status: 'SUCCESS', data: todo }
        else
          render json: { status: 'ERROR', data: todo.errors }
        end
      end

      def update
        if @todo.update(todo_params)
          render json: { status: 'SUCCESS', data: @todo }
        else
          render json: { status: 'ERROR', data: @todo.errors }
        end
      end

      def destroy
        @todo.destroy
        render json: { status: 'SUCCESS', message: 'Deleted the post', data: @post }
      end

      private
      def set_todo
        @todo = Todo.find(params[:id])
      end

      def todo_params
        params.require(:todo).permit(:description, :completed)
      end
    end
  end
end
