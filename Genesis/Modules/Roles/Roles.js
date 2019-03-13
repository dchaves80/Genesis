// Definición de draggable
$(window).on('load', function () {
    

    $('.draggable').draggable({
        // Propiedades
        opacity: 0.5,
        revert: true,
        revertDuration: 500,
        start: function (event, ui) {
            
        },
        stop: function (event, ui) {
            
        }
    })
})

// Editar rol
function EditarRol(object) {
    $(object).siblings('div').animate({
        opacity: "1",
        left: "+=50px",
    }, 500, function () {
        $(object).attr("disabled", "disabled");
        $(object).removeClass("ButtonDark");
        $(object).addClass("ButtonDarkDisabled");
    })
}