$(document).ready(function() {
    if($('.alert').length){
        setTimeout(function () {
            $('.alert').slideUp(1000, function () {
                $(this).remove();
            });
        }, 10000)
    }
    $('.grid-gallery').on('click', 'div.door-item', function (e) {
        if(e.target.tagName === 'A' || e.target.tagName === "SPAN"){
            //var id = $(this).closest('.door-item').find('input[type="hidden"]').val();
        }
        else{
            var a = $(e.target).closest('.door-item').find('a.show-link')[0];
            location.href = $(a).attr('href');
        }
    });
    $("#upload_img").on('click', function (e) {
        $("#door_photo").click();
    });

    //Upload image preview start
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function(e) {
                $('#img-preview').attr('src', e.target.result);
            };

            reader.readAsDataURL(input.files[0]);
        }
    }

    $("#door_photo").change(function() {
        readURL(this);
    });
    //Upload image preview end

    if($('#door').length){
        $('#door').closest('a').attr('href', $('#door').attr('src'));
    }

    //slider for search start
    $( function() {
        $( "#slider-range" ).slider({
            range: true,
            min: 0,
            max: 500,
            values: [ 0, 500 ],
            slide: function( event, ui ) {
                $( "#price" ).val(ui.values[ 0 ] + "грн - " + ui.values[ 1 ] + "грн" );
            }
        });
        $( "#price" ).val($( "#slider-range" ).slider( "values", 0 ) +
            "грн - " + $( "#slider-range" ).slider( "values", 1 ) + "грн" );
    } );
    //slider for search end
    //pagination start
    $(document.body).on("click", ".pagination a", function() {
        $(".pagination").html("Дані оновлюються...");
        $.getScript(this.href);
        return false;
    });
    $('.our-latest').on('click', '.latest-bg-pos', function (e) {
        var a = $(e.target).closest('.latest-grid').find('a.show-link')[0];
        location.href = $(a).attr('href');
    });
    //pagination end
    $('#door-opening').on('click', 'div.open', function () {
        $('.change-opening').removeClass('change-opening').find('input:radio').removeAttr('checked');
        $(this).addClass('change-opening').find('input:radio').prop('checked', true);
    });

    $('#material-checkbox').click(function(){
        if($(this).is(':checked') === false){
            $('#order_material_id').prop('disabled', true);
            var id = $('#mat_id').val();
            $( "select#order_material_id" ).val(id);
        }
        else{
            $('#order_material_id').prop('disabled', false);
        }
    });

    $('#phone-num').mask("(999)-999-9999");
});
