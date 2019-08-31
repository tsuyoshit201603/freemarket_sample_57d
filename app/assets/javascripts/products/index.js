$(function(){

  $('.contents__product-information__special-feature__icon-right').on('click', function(){
    $('.contents__product-information__special-feature__image').attr('src', 'https://www.mercari.com/jp/assets/img/common/jp/top/download_bg_pc.jpg?59301348');
  });

  $('.contents__product-information__special-feature__icon-left').on('click', function(){
    $('.contents__product-information__special-feature__image').attr('src', 'https://www-mercari-jp.akamaized.net/assets/img/featured/camp/index/index_keyvisual.png?4148637188');
  });

  var count = 0;
  setInterval(function(){
    if (count % 2 == 0){
      $('.contents__product-information__special-feature__image').attr('src', 'https://www.mercari.com/jp/assets/img/common/jp/top/download_bg_pc.jpg?59301348');
      count += 1;
    }  
    else {
      $('.contents__product-information__special-feature__image').attr('src', 'https://www-mercari-jp.akamaized.net/assets/img/featured/camp/index/index_keyvisual.png?4148637188');
      count += 1;
    }
  }, 5000);

});
