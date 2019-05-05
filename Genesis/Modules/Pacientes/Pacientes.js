
// data function Create()

///                         ///
///         OTHERS          ///
///                         ///
// Check Health Insurance


$('input').on("change", function () {
    console.log($('#chboxHealthInsurance').is(":checked"));
})



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
