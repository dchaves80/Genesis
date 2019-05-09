
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
            chbox.parent().siblings("div").fadeIn(400);

        else
            chbox.parent().siblings("div").fadeOut(400);
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

    var iButton = $(object);
    var inputsDiv = iButton.parent().next()
    var searchPatient = iButton.siblings("label");
    

    if (inputsDiv.is(":visible")) {

        iButton.css("transform", "rotate(0deg)");
        searchPatient.show("slow");
        inputsDiv.hide("drop");
    }
    else {

        iButton.css("transform", "rotate(45deg)");
        searchPatient.hide("slow");
        inputsDiv.show("drop");

    }

        
    
    

    

    //window.setTimeout(function () {  }, 10);
    

}