Rails.application.routes.draw do
  root "projects#index"

  resources :tasks
  resources :projects

  get "projects/:id/project_calendar",      to: "projects#project_calendar",      as: "project_calendar"
  get "projects/:id/project_week_calendar", to: "projects#project_week_calendar", as: "project_week_calendar"
  get "tasks/:id/task_calendar",            to: "tasks#task_calendar",            as: "task_calendar"
end
