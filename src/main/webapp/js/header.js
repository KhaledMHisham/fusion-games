 
 const jumbotronHeight = document.querySelector('.header').offsetHeight;

 $(window).scroll(function(){
  if ($(window).scrollTop() >jumbotronHeight) {
      $('.nav-bar').addClass('fixed-header');
  }
  else {
      $('.nav-bar').removeClass('fixed-header');
  }
});
 