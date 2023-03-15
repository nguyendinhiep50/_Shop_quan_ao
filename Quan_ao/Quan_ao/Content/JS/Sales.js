
// Lay cac phan tu img trong phan tu cha ra 
const imgPosition = document.querySelectorAll(".paner-img img");
// console.log(imgPosition); // => Tra ve cac phan tu trong mang
// Ham tu dong
const imgContainer = document.querySelector(".paner-img");
let index = 0;
// Lay so items
let imgNumber = imgPosition.length;
const dotItems = document.querySelectorAll(".dot");


imgPosition.forEach(function(image, index) {
    // console.log(image, index);  //=> Xem cac phan tu
    // Can chinh theo chieu ngang
    image.style.left = index * 100 + "%";
    dotItems[index].addEventListener("click", function() {
        slider(index);
    });

}) ;
function imgSlider() {
    index++;           
    console.log(index);
    if(index >= imgNumber) {
        index = 0
    }
    imgContainer.style.left = "-" + index * 100 + "%";
    const dotActive = document.querySelector(".active");
    dotActive.classList.remove("active");
    dotItems[index].classList.add("active");

}
setInterval(imgSlider, 5000);
function slider(index) {
    imgContainer.style.left = "-" + index * 100 + "%";
    const dotActive = document.querySelector(".active");
    dotActive.classList.remove("active");
    dotItems[index].classList.add("active");
}


// --------------------------------Cartegory menu-------------------------------

const menubarCartegory = document.querySelectorAll(".size");    
menubarCartegory.forEach(function(menu, index){
    menu.addEventListener("click", function(){
        menu.classList.toggle("block");
    })
})

// ------------------------------------Product------------------------------------------
const gioithieusp = document.querySelector(".gioithieu_tab");
const chitiet = document.querySelector(".chitiet_tab");
const baoquan = document.querySelector(".baoquan_tab")
if(gioithieusp) {
        gioithieusp.addEventListener("click", function() {
        document.querySelector(".information_content_items_text_chitietsanpham").style.display = "none";
        document.querySelector(".information_content_items_text_gioithieu").style.display = "block";
        document.querySelector(".information_content_items_text_baoquan").style.display = "none";
    })
}
if(chitiet) {
    chitiet.addEventListener("click", function() {
    document.querySelector(".information_content_items_text_chitietsanpham").style.display = "block";
    document.querySelector(".information_content_items_text_gioithieu").style.display = "none"
    document.querySelector(".information_content_items_text_baoquan").style.display = "none";
    })
}
if(baoquan) {
    baoquan.addEventListener("click", function() {
    document.querySelector(".information_content_items_text_chitietsanpham").style.display = "none";
    document.querySelector(".information_content_items_text_gioithieu").style.display = "none";
    document.querySelector(".information_content_items_text_baoquan").style.display = "block";
    })
}


// ------------------------------------Cart---------------------------------------
const colorCart = document.querySelectorAll(".cart_content_right_text p i");
console.log(colorCart);
setInterval(function(){
    colorCart.forEach(function(color){
        color.classList.toggle("color1");
    })
}, 200);
