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


document.addEventListener('DOMContentLoaded', function () {
    const starsContainer = document.querySelector('.rating-stars');
    const ratingInput = document.querySelector('input[name="comment[rating]"]');
    const stars = starsContainer.querySelectorAll('.star');

    starsContainer.addEventListener('click', function (event) {
        const selectedStars = event.target.dataset.rating;

        // If you click on a star, set the rating to the star value
        // Otherwise, set the rating to zero to unselect
        ratingInput.value = (ratingInput.value === selectedStars) ? 0 : selectedStars;

        // Update stars based on the current rating value
        updateStars();
    });

    function updateStars() {
        stars.forEach((star, index) => {
            const starValue = index + 1;
            const starIcon = star.querySelector('i');

            if (starValue <= ratingInput.value) {
                starIcon.classList.remove('bi-star');
                starIcon.classList.add('bi-star-fill');
            } else {
                starIcon.classList.remove('bi-star-fill');
                starIcon.classList.add('bi-star');
            }
        });
    }
});



import Rails from "@rails/ujs";
Rails.start();


