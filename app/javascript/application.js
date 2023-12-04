// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import 'bootstrap/dist/js/bootstrap';


// app/javascript/application.js
import "bootstrap";





//= require rails-ujs
//= require turbolinks
//= require_tree .


import Rails from "@rails/ujs";
Rails.start();
