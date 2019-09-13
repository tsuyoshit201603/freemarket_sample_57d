$(function(){
  $(".contents__header__inner__down__left__category").on("mouseover",function(){
    $(".categoryIndex__parents").show();
    var categoryXY = $(".contents__header__inner__down__left__category").offset();
    var x = categoryXY.left;
    var y = categoryXY.top;
    $(".categoryIndex").offset({ top: y + 44, left: x - 5 });
  }).on("mouseleave",function(){
    $(".categoryIndex__parents").hide();
  })
  ;
  $(".categoryIndex__parents").on("mouseleave", function(){
    $(".categoryIndex__children").hide();
  });
  $(".categoryIndex__parents__parent").on("mouseenter", function(){
    $(this).find(".categoryIndex__children").show();
    $(this).css("background-color","#ea352d");
    $(this).find(".categoryIndex__parents__parent__name").css("color","#FFFFFF");
  })
  .on("mouseleave", function(){
    $(this).find(".categoryIndex__children").hide();
    $(this).css("background-color","#FFFFFF");
    $(this).find(".categoryIndex__parents__parent__name").css("color","#000000");
  });

  // 子供カテゴリーに関するイベント駆動
  $(".categoryIndex__children__child").on("mouseenter", function(){
    $(this).find(".categoryIndex__grandchildren").show();
    $(this).css("background-color","#f4f4f4");
  })
  .on("mouseleave", function(){
    $(this).find(".categoryIndex__grandchildren").hide();
    $(this).css("background-color","#FFFFFF");
  });
  $(".categoryIndex__children").on("mouseleave", function(){
    $(".categoryIndex__grandchildren").hide();
  })

  // 孫カテゴリーに関するイベント駆動
  $(".categoryIndex__grandchildren__grandchild").on("mouseenter", function(){
    $(this).css("background-color","#f4f4f4")
  })
  .on("mouseleave", function(){
    $(this).css("background-color","#FFFFFF");
  })
})