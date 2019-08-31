$(function(){
  $('.contents__outline__mypage__midle__tab__left').on('click', function() {
    $(".contents__outline__mypage__midle__tab__right").removeClass("active");
    $(this).addClass("active");
  });

  $('.contents__outline__mypage__midle__tab__right').on('click', function() {
    $(".contents__outline__mypage__midle__tab__left").removeClass("active");
    $(this).addClass("active");
  });

  $(".contents__outline__mypage__midle__contents__right").hide();
  $('.contents__outline__mypage__midle__tab__left').on('click', function() {
    $(".contents__outline__mypage__midle__contents__right").hide();
    $(".contents__outline__mypage__midle__contents__left").show();
  });

  $('.contents__outline__mypage__midle__tab__right').on('click', function() {
    $(".contents__outline__mypage__midle__contents__left").hide();
    $(".contents__outline__mypage__midle__contents__right").show();
  });

  $('.contents__outline__mypage__down__tab__left').on('click', function() {
    $(".contents__outline__mypage__down__tab__right").removeClass("active");
    $(this).addClass("active");
  });

  $('.contents__outline__mypage__down__tab__right').on('click', function() {
    $(".contents__outline__mypage__down__tab__left").removeClass("active");
    $(this).addClass("active");
  });
  
  $(".contents__outline__mypage__down__right__contents").hide();
  $('.contents__outline__mypage__down__tab__left').on('click', function() {
    $(".contents__outline__mypage__down__right__contents").hide();
    $(".contents__outline__mypage__down__left__contents").show();
  });

  $('.contents__outline__mypage__down__tab__right').on('click', function() {
    $(".contents__outline__mypage__down__left__contents").hide();
    $(".contents__outline__mypage__down__right__contents").show();
  });
});