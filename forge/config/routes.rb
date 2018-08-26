# frozen_string_literal: true

Rails.application.routes.draw do
  mount_ember_app :frontend, to: "/"
end
