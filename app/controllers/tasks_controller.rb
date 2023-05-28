class TasksController < ApplicationController
  def index
		@tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    task = Task.find(params[:id])
    task.update!(task_params)
    redirect_to tasks_url, notice: "タスク「#{task.name}」を実装しました"
  end

  def create
    # task_paramsメソッドで安全化されたtaskパラメータを取得する
    task = Task.new(task_params)
    # save!メソッドはsaveメソッドと違い失敗した時に例外を返す（saveはfalseを返す）
    task.save!
    redirect_to tasks_url, notice: "タスク「#{task.name}」を登録しました。"
  end

def destroy
	task = Task.find(params[:id])
	task.destroy
	redirect_to tasks_url, notice: "タスク「#{task.name}」を削除しました"
end

  private

  def task_params
    params.require(:task).permit(:name, :description)
  end
end
