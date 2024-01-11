# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...




<% if user_signed_in? %>
<%= form_with(model: [@product, @product.comments.build], html: { class: 'comment-form' }) do |form| %>
<div class="form-group mb-2">
<%= form.label :rating, class: 'text-light mb-1' %>
<div class="rating-stars">
<% (1..5).to_a.reverse.each do |rating| %>
<span class="star" data-rating="<%= rating %>">★</span>
<% end %>
<%= form.number_field :rating, class: 'rating-input', value: '' %>
</div>
</div>

    <div class="form-group mb-2">
      <%= form.label :body, class: 'text-light mb-1' %>
      <%= form.text_area :body, class: 'form-control bg-dark text-light rounded', placeholder: 'Napisz komentarz...', rows: 3, required: true %>
    </div>

    <div class="text-right">
      <%= form.submit 'Dodaj komentarz', class: 'btn btn-success btn-sm rounded-pill' %>
    </div>
<% end %>
<% else %>
<%= link_to 'Dodaj komentarz', new_user_session_path, class: 'btn btn-success btn-sm rounded-pill' %>
<% end %>
