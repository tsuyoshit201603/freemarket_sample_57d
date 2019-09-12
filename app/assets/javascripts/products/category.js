$(function(){
  var selectbox = [];
  selectbox[0] = $(".ancestry__parent");
  selectbox[1] = $(".ancestry__child");
  selectbox[2] = $(".ancestry__grandChild");
  var url = "/api/products";
  function appendHTML(position,data){
    var html =`
    <div class="main__product__details__h2-choice">
      <select name="product[category_id]" id="product_category_id">
        <option value = "">---</option>
        ${data}
      </select>
      <i class="fa fa-chevron-down main__product__delivery__sell-box__icon"></i>
    </div>
    `
    position.append(html);
  }

  function createSelect(data){
    var option = "";
    $.each(data,function(index,val){
      option = option + `<option value= "${val.id}">${val.name}</option>\n`
    });
    return option
  }
  //非同期通信を行うfunction
  function ajaxForCategory(selected, i){
    var selectedNum = {selected: selected.find("select").val()};
    $.ajax({
      url: url,
      data: selectedNum
    })
    .done(function(data){
      if(data.length){
        var option = createSelect(data);
        selectbox[i].html("");
        appendHTML(selectbox[i],option);
      }else{
        if(i == 1){
          selectbox[1].empty();
          selectbox[2].empty();
        }
        else{
          selectbox[2].empty();
        }
      }
    })
    .fail(function(e) {
      window.alert(e);
    });
  }

  //一段目のカテゴリーを選択した際に非同期通信
  selectbox[0].on("change", function(){
    ajaxForCategory($(this),1);
  });
  //二段目のカテゴリーを選択した際に非同期通信
  selectbox[1].on("change", function(){
    ajaxForCategory($(this),2);
  });
  //３段目のカテゴリーを選択した際にサイズとブランドの入力欄を表示
  selectbox[2].on("change", function(){
    $(".hiddenInputForDetails").removeClass("hiddenInputForDetails");
  });
})