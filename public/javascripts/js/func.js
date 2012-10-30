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
      var docHeight = $(document).height(),
        cartHeight = $('.cart').innerHeight(),
        cartFixed = $('html').hasClass('scrolled-to-bottom');

      if (cartFixed) docHeight -= cartHeight;

      var scrolledToBottom = $(document).scrollTop() + windowHeight - cartHeight >= docHeight - $('footer').innerHeight();
      $('html').toggleClass('scrolled-to-bottom', scrolledToBottom); // класс переключается у <html>
    })
}

var Spoiler = function() {
   $(".sp").live('click', function() {
      $(".sp_show").slideToggle("fast", function(){ $('body').scroll() });
      $(".control.sp").toggleClass("active"); return false;
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

var RestorePasswordForm = function() {
  $('.l-restore').live('click', function(e){
    e.preventDefault();
    $('.restore-password-form').show();
  });

  $('.restore-password-form .close').live('click', function(e){
    e.preventDefault();
    $('.restore-password-form').hide();
  });

  $('.forgot-mess .close-little').live('click', function(e){
    e.preventDefault();
    $('.restore-password-form .forgot-mess').hide();
  });
}

var ProductImages = function() {
  $('.product_image_thumb').live('click', function(e){
    e.preventDefault();
    var imageSrc = $(this).attr('href');
    $('#product_image').attr('src', imageSrc);
  });
}

var NewAddressRadio = function() {
  $('.adress-choise input[type=radio]').live('change', function(){
    var Checked = $('.new_address_radio').prop('checked');
    (Checked == true) ? $('.all-fields').show() : $('.all-fields').hide(); 
  });
}

var PlaceHolders = function() {
  $("input[placeholder], textarea[placeholder]").textPlaceholder();
}

var Checkout = function() {
  $('.cart .panel .cart-order').live('click', function (){
    var url = $('.cart .panel .cart-order').attr('data-url');
    window.location = url;
  });
}

var MaskInp = function() {
  $('.phone_mask').mask('+7 (999) 999-9999');
  $('.postal_mask').mask('999999');
}

$(function(){
    // SortLinks();
    ResetSorting();
    SlickFoot();
    Spoiler();
    Slides();
    LoginForm();
    RegistrationForm();
    RestorePasswordForm();
    ProductImages();
    NewAddressRadio();
    PlaceHolders();
    Checkout();
    MaskInp();
})