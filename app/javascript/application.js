// app/javascript/application.js
import "controllers";
import "bootstrap";
import "jquery";
import "jquery_ujs";
import "jquery-star-rating";
import "@hotwired/turbo-rails";
import "bootstrap-icons/font/bootstrap-icons.css";



const starsContainer = document.querySelector('.rating-stars');

$(document).on('turbolinks:load', function () {
    $('.rating-input').rating();
});



// app/javascript/application.js
document.addEventListener('DOMContentLoaded', function () {
    const starsContainer = document.querySelector('.rating-stars');
    const ratingInput = document.querySelector('input[name="comment[rating]"]');
    const stars = starsContainer.querySelectorAll('.star');

    starsContainer.addEventListener('click', function (event) {
        const selectedStars = event.target.dataset.rating;

        // Set the rating to the selected stars
        ratingInput.value = selectedStars;

        // Update stars based on the current rating value
        updateStars();
    });

    function updateStars() {
        stars.forEach((star, index) => {
            const starValue = index + 1;

            if (starValue <= ratingInput.value) {
                star.innerHTML = '★';
            } else {
                star.innerHTML = '☆';
            }
        });
    }
});



import Rails from "@rails/ujs";
Rails.start();


