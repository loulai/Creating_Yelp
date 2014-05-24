$(document).ready(function() {
	$('.new_review').on('submit', function(event){
		event.preventDefault();
		var reviewList = $(this).siblings('ul');

		$.post($(this).attr('action'), $(this).serialize(), function(response) {
			var template = $('#review_template').html();
			var newReview = Mustache.render(template, response); 
			reviewList.appeend(newReview);
		});
	})
});