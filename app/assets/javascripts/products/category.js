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

})