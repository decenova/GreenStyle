var storageCartKey = "MY_PRODUCTS";

function Product(productId, imgOnlineLink, fullName, warranty, quantity, price) {
  this.productId = productId;
  this.imgOnlineLink = imgOnlineLink;
  this.fullName = fullName;
  this.warranty = warranty;
  this.quantity = quantity;
  this.price = price;
  this.totalPrice = function () {
      return this.quantity * this.price;
  };
}
function initCart() {
  myCartObj = new Array();
  cartCount = 0;
  if (getLocalData(storageCartKey) !== null) {
      myCartObj = JSON.parse(getLocalData(storageCartKey));
      cartCount = myCartObj.length;
  } else {
      console.log("Cart is empty");
  }
}

function addToCart(productId, imgOnlineLink, fullName, warranty, quantity, price) {
  var tmp = 0;
  var productItem = new Product(productId, imgOnlineLink, fullName, warranty, quantity, price);
  if (typeof (localStorage) !== "undefined") {
      for (var i = 0; i < myCartObj.length; i++) {
          if (myCartObj[i].productId == productId) {
              myCartObj[i].quantity = parseInt(myCartObj[i].quantity) + 1;
              tmp++;
              break;
          }
      }
      if (tmp == 0) {
          myCartObj[cartCount++] = productItem;
      }
      setLocalData(storageCartKey, JSON.stringify(myCartObj));
      getProductFromStorage();
  } else {
      alert("Browser is not supported storage!!!");
  }
}
function getLocalData(key) {
  return localStorage.getItem(key);
}
function setLocalData(key, value) {
  if (value !== null) {
      localStorage.setItem(key, value);
  } else {
      localStorage.removeItem(key);
  }
}
var totalPrice = 0;
function getProductFromStorage() {
  totalPrice = 0;
  var id, imgOnlineLink, fullName, quantity, warranty, price;
  var item, productItem;
  var cart_div = document.getElementById('my-cart-id');
  cart_div.innerHTML = "";
  var index = 1;
  for (item of myCartObj) {
      if (item !== null) {
          id = item["productId"];
          imgOnlineLink = item["imgOnlineLink"];
          fullName = item["fullName"];
          quantity = item["quantity"];
          warranty = item["warranty"];
          price = item["price"];
          productItem = new Product(id, imgOnlineLink, fullName, warranty, quantity, price);
          addProductToTable(productItem, index++);
      }
  }
}
function addProductToTable(productItem, index) { //elementId: thứ tự trong array    
    var cart_div = document.getElementById('my-cart-id');
    var totalSpan = document.getElementById('totalPriceId');
    var product_div;
    product_div = '<tr class="product-item-cart">';
    product_div += '<td>' + index + '</td>'; 
    product_div += '<td><img src="' + productItem.imgOnlineLink + '" alt="' + productItem.fullName + '"/></td>';
    product_div += '<td>' + productItem.fullName + '</td>'; 
    product_div += '<td>' + productItem.warranty + '</td>'; //warranty
    product_div += '<td><input type="number" id="qtt' + productItem.productId
            + '" min="1" value="' + productItem.quantity + '"/></td>'; //quantity
    product_div += '<td style="color: blue;">' + productItem.price + ' VNĐ</td>';
    product_div += '<td style="color: blue;">' + productItem.totalPrice() + ' VNĐ</td>';
    product_div += '<td><button class="DelCartBtn" onclick="deleteProduct(' + productItem.productId + ')">X</button></td>';
    product_div += '</tr>'; //price
    cart_div.innerHTML += product_div;
    totalPrice += parseInt(productItem.totalPrice());
    totalSpan.innerHTML = 'Tổng tiền: ' + totalPrice + ' VNĐ';
}
function deleteProduct(rejectId) {
    totalPrice = 0;
    myCartObj = myCartObj.filter(product => product.productId !== rejectId.toString());
    setLocalData(storageCartKey, JSON.stringify(myCartObj));
    cartCount -= 1;
    getProductFromStorage();
}
function deleteAllProduct() {
    totalPrice = 0;
    var result = confirm("Bạn có chắc chắn xóa giỏ hàng?");
    if (result == true) {
        myCartObj = null;
        setLocalData(storageCartKey, "[]");
        var cart_div = document.getElementById("my-cart-id");
        cart_div.innerHTML = "";
        initCart();
    }
}
function updateCart() {
    totalPrice = 0;
    var input_quantity;
    var index;
    for (var item of myCartObj) {
        input_quantity = document.getElementById("qtt" + item.productId);
        index = myCartObj.findIndex(pro => pro.productId == item.productId); //lấy index của sp có Id
        myCartObj[index].quantity = input_quantity.value; // cập nhật lại quantity
    }
    setLocalData(storageCartKey, JSON.stringify(myCartObj));
    getProductFromStorage();
    alert("Cập nhật thành công");
}
function checkoutCart() {
    // if (customerId === null || customerId === "") {
    //     alert("Bạn cần đăng nhập để xác nhận mua hàng!");
    //     return;
    // }
    // var result = confirm("Bạn có chắc chắn mua hàng?");
    // if (result) {
        myCartObj = JSON.parse(getLocalData(storageCartKey));
        console.log(myCartObj);
    // }
    $.ajax({
        url: '/add_to_cart',
        method: 'post',
        data: {my_cart: myCartObj, total_price: totalPrice},
        success: function(data) {
            alert(data.noti);
        }
    })
}
