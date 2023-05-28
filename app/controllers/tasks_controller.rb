class TasksController < ApplicationController
  def index
  end

  def show
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    # task_paramsメソッドで安全化されたtaskパラメータを取得する
    task = Task.new(task_params)
    # save!メソッドはsaveメソッドと違い失敗した時に例外を返す（saveはfalseを返す）
    task.save!
    redirect_to tasks_url, notice: "タスク「#{task.name}」を登録しました。"
  end

  private

  def task_params
    params.require(:task).permit(:name, :description)
  end
end
