$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()

  $("form#posts").submit(function(e){
    e.preventDefault();
    console.log("form submit fired");
    var form = $(this);
    console.log(form.attr('action'));
    console.log(form.attr('method'));

    $.ajax({
        url: form.attr('action'),
        type: form.attr('method'),
        data: form.serialize()
    })
    .done(function(response) {
        console.log(response);
        $(".post-container").append(response);
    })
  })
});
