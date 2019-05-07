
// data function Create()

///                         ///
///         LOAD            ///
///                         ///
$(window).on('load', function () {

    // Event Handler
    CheckHealthInsurance();
        
})

///                         ///
///         OTROS           ///
///                         ///
// Check Health Insurance
function CheckHealthInsurance() {
    var chbox = $('#chboxHealthInsurance');

    chbox.on("change", function () {

        if (chbox.is(":checked"))
            chbox.parent().siblings("div").fadeIn(100);

        else
            chbox.parent().siblings("div").fadeOut(100);
    })
}

///                         ///
///         CREATE          ///
///                         ///
// Create Patient
function Create() {
    $.ajax({
        url: '/Modules/Pacientes/WebServicePacientes.aspx',
        dataType: 'text',
        data:
        {
            create: 'true',
        },
        success: function (data) {

            if (data == "True") {

                // Created

            }
            else {

                // Error

            }
        }
    })
}

///                         ///
///         SEARCH          ///
///                         ///
// Search for Patients by NAME OR DNI
function getPatientsByParam(patientParam) {
    $.ajax({
        url: '/Modules/Pacientes/WebServicePacientes.aspx',
        dataType: 'json',
        data:
        {
            getPatientsByParam: 'true',
            patientParam: patientParam,
        },
        success: function (data) {

        }
    })
}

///                         ///
///         TEST            ///
///                         ///
// Testing function
function Test(object) {

    $(object).siblings("label").hide("drop");

    $(object).addClass("rotate");

    $(object).parent().next().show("slow");
    

}