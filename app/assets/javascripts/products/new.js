$(function(){
  var fileArea = $(".main__product__item__h3");
  var context = $(".main__product__item__h3__context");
  var file = $(".main__product__item__h3__image");
  var list = [];
  var cost = $(".main__product__price__h2-choice");
  list[0] = $("#uploadedListFirst");
  list[1] = $("#uploadedListFinal");
  var num = 0;
  var arrayNum = 0;
  var form = 2;
  function appendHTML(url,arrayNum,num){
    var html = `
    <li class= "uploadedItem" data-num = "${num}">
      <figure class = "uploadedItem__figure">
        <img src ="${url}">
      </figure>
      <div class = "uploadedItem__buttons">
        <div class = "uploadedItem__buttons__edit">
          <a href >編集</a>
        </div>
        <div class = "uploadedItem__buttons__delete">
          <a href >削除</a>
        </div>
      </div>
    </li>
    `
    list[arrayNum].append(html);
  }

  file.on('change',function() {
    var image = this.files[0];
    var reader = new FileReader();
    reader.onload = (function() {
      appendHTML(reader.result,arrayNum,num);
      fileArea.attr("for",`product_image${form}`)
      form++
      fileArea.removeClass(`main__product__item__h3--num${num}`);
      context.removeClass(`main__product__item__h3__context--num${num}`);
      if(num >= 0 && num <= 3){
        num++;
      }
      else{
        num = 0;
        if(arrayNum == 1){
          $(".removefileuploader").css("display","none");
        }
        arrayNum++;
      }
      fileArea.addClass(`main__product__item__h3--num${num}`);
      context.addClass(`main__product__item__h3__context--num${num}`);
    });
    reader.readAsDataURL(image);
  });

  cost.on("keyup", function(){
    var input = $(this).val();
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