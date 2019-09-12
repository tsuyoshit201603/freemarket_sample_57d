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

  // ファイルフィールドのファイルが変更された際にファイルを読み込む
  file.on('change',function() {
    var image = this.files[0];
    var reader = new FileReader();
    // ファイルの読み込みが終わった際に処理を行う
    reader.onload = (function() {
      fileArray.push(reader.result);
      appendHTML(fileArray[fileArray.length - 1],arrayNum,listNum);
      listNum++;
      fileArea.attr("for",`product_image${listNum}`);
      fileArea.removeClass(`main__product__item__h3--num${num}`);
      context.removeClass(`main__product__item__h3__context--num${num}`);
      if(num >= 0 && num <= 3){
        num++;
      }
      else{
        num = 0;
        if(arrayNum == 1){
          num = 5;
        }
        arrayNum++;
      }
      fileArea.addClass(`main__product__item__h3--num${num}`);
      context.addClass(`main__product__item__h3__context--num${num}`);
    });
    reader.readAsDataURL(image);
  });

  // ページが読み込まれたらサムネイルを生成する
  if ($(".editMain").length){
    window.onload = function(){
      var url = `/api${window.location.pathname}`
      $.ajax({
        url: url
      })
      .done(function(data){
        $.each(data,function(index,value){
          fileArray.push(value.image.url);
          listNum = index;
          appendHTML(value.image.url,arrayNum,listNum,value.id);
          listNum++;
          if(index <= 5){
            num = index + 1;
          }
          if(num >= 5){
            num = num - 5;
            arrayNum = 1;
          }
          if(index == 9){
            num = 5;
          }
        });
        fileArea.addClass(`main__product__item__h3--num${num}`);
        context.addClass(`main__product__item__h3__context--num${num}`);
        fileArea.attr("for",`product_image${listNum}`);
      })
      .fail(function(error){
        window.alert("error");
      });
      setTimeout(function() {
        $(".loadingArea").fadeOut();
        $(".editMain").fadeIn();
      }, 500);
    }
  }

  // 削除リンクが押された際にサムネイルを削除する
  $(document).on("click",".uploadedItem__buttons__delete", function(e){
      e.preventDefault();
      var thumbnail = $(this).parents(".uploadedItem");
      var deleteListNum = thumbnail[0].dataset.num;
      var deleteIDNum = thumbnail[0].dataset.id;
      var allListsNum = list[0].children().length + list[1].children().length;
      listNum = allListsNum - 1;
      if(allListsNum > 5){
        num = allListsNum - 5
      }else{
        num = allListsNum
      }
      //ファイルアップロードエリアの大きさを変更する
      fileArea.removeClass(`main__product__item__h3--num${num}`);
      context.removeClass(`main__product__item__h3__context--num${num}`);
      num--
      fileArea.addClass(`main__product__item__h3--num${num}`);
      context.addClass(`main__product__item__h3__context--num${num}`);
      var deletedForm = $(`#product_image${deleteListNum}`);
      var lastForm = $(`#product_image${listNum}`);

      // 削除されたサムネイルを保存していたフォームの内容を削除
      if(deletedForm.val().length){
        deletedForm.val("");
        deletedForm.attr("id",`product_image${listNum}`);
        lastForm.attr("id",`product_image${deleteListNum}`);
        fileArea.attr("for",`product_image${listNum}`);
      }
    });
});