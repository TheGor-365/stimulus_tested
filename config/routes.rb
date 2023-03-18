Rails.application.routes.draw do
  root "projects#index"

  resources :tasks
  resources :projects

  get "projects/:id/project_calendar",      to: "projects#project_calendar",       as: "project_calendar"
  get "projects/:id/project_week_calendar", to: "projects#project_week_calendar",  as: "project_week_calendar"
  get "tasks/:id/task_calendar",            to: "tasks#task_calendar",             as: "task_calendar"
  get "tasks/:id/task_week_calendar",       to: "tasks#task_week_calendar",        as: "task_week_calendar"
  get 'projects/:id/project_line_chart',    to: 'projects#project_line_chart',     as: 'project_line_chart'
  get 'tasks/:id/task_line_chart',          to: 'tasks#task_line_chart',           as: 'task_line_chart'
end
