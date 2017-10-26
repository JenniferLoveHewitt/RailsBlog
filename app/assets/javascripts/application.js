//= require bootstrap
//= require jquery
//= require jquery_ujs
//= require_tree .

$(function(){
    $("#btn-search").click(function (event) {
        var search = $("#input-search").val();

        if (search != "")
            window.location.replace("/articles?searching=" + search);

        console.log(1);

        event.preventDefault();
    });

    $('.dropdown').hover(function() {
        $(this).find('.dropdown-menu').first().stop(true, true).delay(250).slideDown();
    }, function() {
        $(this).find('.dropdown-menu').first().stop(true, true).delay(100).slideUp()
    });
});
