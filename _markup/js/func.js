var SortLinks = function(){
    $('.none, .up, .down').click(function() {                             
        this.className = {
           down : 'none', none: 'up', up: 'down'
        }[this.className];
        return false;
    });
    $('reset-sorting').click(function() {
        $('.sorting li a').removeClass('none').removeClass('up').removeClass('down').addClass('none');
        return false;
    });
}

$(function(){
    SortLinks();
    ResetSorting();
})