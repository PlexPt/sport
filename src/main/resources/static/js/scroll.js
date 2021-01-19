window.onscroll = function () {
    var topScroll = get_scrollTop_of_body();
    var bignav = document.getElementById("bignav");
    var bignavDiv = document.getElementById("bignavDiv");
    var bannerHeight = $(".banner").height();
    if (topScroll > bannerHeight) {
        bignav.style.position = 'fixed';
        bignav.style.top = '0';
        bignav.style.zIndex = '9999';

        bignavDiv.style.position = 'fixed';
        bignavDiv.style.margin = 'auto';
        bignavDiv.style.left = '0';
        bignavDiv.style.right = '0';
        bignavDiv.style.width = '1200px';
        bignavDiv.style.height = '150px';
        bignavDiv.style.zIndex = '9999';

    } else {
        bignav.style.position = 'static';
        bignavDiv.style.position = 'static';
    }
}

/*解决浏览器兼容问题*/
function get_scrollTop_of_body() {
    var scrollTop;
    if (typeof window.pageYOffset != 'undefined') {
        scrollTop = window.pageYOffset;
    } else if (typeof document.compatMode != 'undefined' && document.compatMode != 'BackCompat') {
        scrollTop = document.documentElement.scrollTop;
    } else if (typeof document.body != 'undefined') {
        scrollTop = document.body.scrollTop;
    }
    return scrollTop;
}
