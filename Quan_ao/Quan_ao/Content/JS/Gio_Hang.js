$(document).ready(function () {
    $('.buy-button').click(function () {
        var productId = $(this).data('product-id');
        var maMau = $(this).data('ma-mau');
        var maSize = $(this).data('ma-size');
        var soLuong = $(this).data('so-luong');
        debugger;
        $.ajax({
            type: 'POST',
            url: 'Gio_hang.aspx',
            data: {
                productId: productId,
                maMau: maMau,
                maSize: maSize,
                soLuong: soLuong
            },
            success: function (result) {
                var cartItem = {
                    productId: productId,
                    quantity: soLuong,
                    Makichthuoc : maSize,
                    MaMau : maMau,
                };
                var cart = [];
                if (sessionStorage.getItem('cart')) {
                    cart = JSON.parse(sessionStorage.getItem('cart'));
                }

                var cartItem = {
                    productId: productId,
                    quantity: soLuong,
                    Makichthuoc : maSize,
                    MaMau : maMau,
                };

                cart.push(cartItem);
                sessionStorage.setItem('cart', JSON.stringify(cart));

            },
            error: function () {
                alert('Đã có lỗi xảy ra, vui lòng thử lại sau.');
            }
        });
    });
});