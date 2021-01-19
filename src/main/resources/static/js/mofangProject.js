$(function(){

    $(document).on("click",".nav>a",function(){
        $(".nav>a").removeClass("active");
        $(this).addClass("active");
        $(".navCon").hide().eq($(this).index()).show()
            new GridScrollFx(document.getElementById('grid'), {

                viewportFactor: 0.4

            });

    })
})