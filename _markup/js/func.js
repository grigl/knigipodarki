SortLinks = function(){
    $('.none, .up, .down').click(function() {                             
        this.className = {
           down : 'none', none: 'up', up: 'down'
        }[this.className];
        return false;
    });
}

$(function(){
    SortLinks();
})