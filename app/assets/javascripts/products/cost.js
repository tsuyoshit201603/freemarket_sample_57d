$(function(){
  var cost = $(".main__product__price__h2-choice");

  // 手数料と利益の計算を行う
  cost.on("keyup", function(){
    var input = $(this).val();
    if(!input.match(/^([1-9]\d*|0)$/)){
      $(this).val("");
    }
    if(input >= 300 && input <= 9999999){
      $(".main__product__price__h3__cost").html(`￥${(Math.round(input * 0.1)).toLocaleString()}`);
      $(".main__product__price__h4__profit").html(`￥${(Math.round(input * 0.9)).toLocaleString()}`);
    }
    else{
      $(".main__product__price__h3__cost").html(`-`);
      $(".main__product__price__h4__profit").html("-");
    }
  });
});