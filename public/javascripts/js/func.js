var SortLinks = function(){
    $('.none, .up, .down').click(function(e) {                             
        this.className = {
           down : 'none', none: 'up', up: 'down'
        }[this.className];
        return false;
    });
}

var ResetSorting = function() {
    $('.reset-sorting').click(function() {
        $('.sorting li a').removeClass('none').removeClass('up').removeClass('down').addClass('none');
        return false;
    });
}


var SlickFoot = function() {
    var windowHeight;

    $(window).resize(function(){
      windowHeight = $(window).height()
    }).resize()

    $(window).scroll(function(){
      var scrolledToBottom = $(document).scrollTop() + windowHeight == $(document).height()
      $('html').toggleClass('scrolled-to-bottom', scrolledToBottom) // класс переключается у <html>
    })
}

var Spoiler = function() {
   $(".sp").live('click', function() {
      $(".sp_show").slideToggle("fast");
      $(this).toggleClass("active"); return false;
   });
}

var Slides = function() {
    $("#slides").slides({
      prev: 'baners-nav-left',
      next: 'baners-nav-right',
      pagination: true,
      paginationClass: 'baners-nav',
      currentClass: 'current',
      effect: 'fade'
    });
}

var LoginForm = function() {
  $('.l-login').live('click', function(e){
    e.preventDefault();
    $('.login-form').show();
  });

  $('.login-form .close').live('click', function(e){
    e.preventDefault();
    $('.login-form').hide();
  });

  $('.forgot-mess .close-little').live('click', function(e){
    e.preventDefault();
    $('.login-form .forgot-mess').hide();
  });
}

var RegistrationForm = function() {
  $('.l-registration').live('click', function(e){
    e.preventDefault();
    $('.registration-form').show();
  });

  $('.registration-form .close').live('click', function(e){
    e.preventDefault();
    $('.registration-form').hide();
  });

  $('.forgot-mess .close-little').live('click', function(e){
    e.preventDefault();
    $('.registration-form .forgot-mess').hide();
  });
}

var ProductImages = function() {
  $('.product_image_thumb').live('click', function(e){
    e.preventDefault();
    var imageSrc = $(this).attr('href');
    $('#product_image').attr('src', imageSrc);
  });
}

$(function(){
    // SortLinks();
    ResetSorting();
    SlickFoot();
    Spoiler();
    Slides();
    LoginForm();
    RegistrationForm();
    ProductImages();
})