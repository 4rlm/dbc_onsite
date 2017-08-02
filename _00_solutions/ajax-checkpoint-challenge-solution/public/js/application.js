$(document).ready(function() {


    // GET HORSE HANDLER
    $("#get-horse-form").on("submit", function(event){
        event.preventDefault();

        var $form = $(this); 
        if ($form.hasClass("clicked")) {
            $(".new-horse-form-wrapper").toggle();
            $form.hide();
        }
        else {
            $.ajax({
                url: $form.attr('action'),
                method: $form.attr('method') 
            })
            .done(function(response){
                $form.hide();
                $form.addClass('clicked');
                $(".container").append(response);
            });
        }
    });

    // NEW HORSE POST HANDLER
    $(".container").on("submit", "#new-horse-form", function(event){
        event.preventDefault();

        var $form = $(this);
        
        $.ajax({
            url: $form.attr('action'),
            method: $form.attr('method'),
            data: $form.serialize()
        })
        .done(function(response){
            $form.parent().toggle();
            $form.trigger('reset');
            $("#get-horse-form").show();
            $(".list").append(response);
        });
    });

    $('.list').on("click", 'a.big.fancy-text.light-link', function(event){
        event.preventDefault();

        var $link = $(this);

        $(".list .list").hide();
        
        if ($link.hasClass('clicked')) {
            $link.siblings('.list').toggle();
        }
        else {
            $.ajax({
                url: $link.attr('href'),
                method: 'GET',
            })
            .done(function(response){
                $link.addClass("clicked");
                $link.parent().append(response);
            });
        }
    })

});
