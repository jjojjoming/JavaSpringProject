$(document).ready(function() {

    let $noticeList = $(".notice-list");

    function replaceQueryParam(param, newval, search) {
        let regex = new RegExp("([?;&])" + param + "[^&;]*[;&]?");
        let query = search.replace(regex, "$1").replace(/&$/, '');

        return (query.length > 2 ? query + "&" : "?") + (newval ? param + "=" + newval : '');
    }

    function goPage(page) {
        location.href = location.pathname + replaceQueryParam("page", page, window.location.search);
    }


    let toggleContents = function($_this) {
        let id = $_this.parent("li").attr("data-id");
        if ($_this.parent("li").hasClass("active")) {
            $_this.next(".contents").slideToggle(200).end().parent("li").toggleClass("active")
        } else {
            $noticeList.find("li.active").find(".contents").slideToggle(200).end().toggleClass("active");
            $_this.next(".contents").slideToggle(200).end().parent("li").toggleClass("active");
            let timer = setTimeout(function() {
                $("html, body").animate({
                    scrollTop: $_this.offset().top - $(".header.fixed").height()
                }, 700);
                clearTimeout(timer)
            }, 300)
        }
    };

    $(document).on("click", ".accordion-title", function() {
        toggleContents($(this))
    })
});