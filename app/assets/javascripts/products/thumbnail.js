$(function(){
  var fileArea = $(".main__product__item__h3");
  var context = $(".main__product__item__h3__context");
  var file = $(".main__product__item__h3__image");
  var list = [];
  list[0] = $("#uploadedListFirst");
  list[1] = $("#uploadedListFinal");
  var num = 0;
  var listNum = 0;
  var arrayNum = 0;
  var fileArray = [];
  var deleteIDArray = [];
  // サムネイル用のHTMLを生成し差し込む
  function appendHTML(url,arrayNum,listNum,id = 0){
    var html = `
    <li class= "uploadedItem" data-num = "${listNum}" data-id = "${id}">
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