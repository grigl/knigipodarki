(function($){
  $(document).ready(function(){

    // Remove an item from the cart by setting its quantity to zero and posting the update form
    $('form#updatecart a.delete').show().live('click', function(e){
      $(this).parents('tr').find('input.line_item_quantity').val(0);
      $(this).parents('form').submit();
      e.preventDefault();
    });

    //add product to cart
    $('.add-to-cart').live('click', function(e){
      e.preventDefault();
      $(this).parents('form').submit();
    });

  });

  // Error messages under fields
  $(function(){
    $('.js-fieldset-with-error').live('change', function(){
      $(this)
        .data('hideErrorPerm', true)
        .addClass('hide-error');
    });
    $('.js-fieldset-with-error').live('focus', function(){
      $(this).addClass('hide-error');
    });
    $('.js-fieldset-with-error').live('blur', function(){
      if (!$(this).data('hideErrorPerm')) {
        $(this).removeClass('hide-error');
      }
    });
  });

})(jQuery);

