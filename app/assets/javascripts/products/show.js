$(function(){ 
  var mainClass = $(".details__content__main__table__main");
  var subClass = $(".details__content__main__table__sub");
  subClass.on('mouseover',function() {
    var subImage = $(this).attr('src');
    subClass.css('opacity', '.4');
    $(this).css('opacity', '1');
    mainClass.attr('src', subImage);
  });
});