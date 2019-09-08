$(function(){
  var fileArea = $(".main__product__item__h3");
  var context = $(".main__product__item__h3__context");
  var file = $(".main__product__item__h3__image");
  var list = [];
  list[0] = $("#uploadedListFirst");
  list[1] = $("#uploadedListFinal");
  var num = 0;
  var arrayNum = 0;

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

});