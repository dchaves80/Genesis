//Evita que se introduzcan espacios en los input
$(function () {
    $('.ExcludeChar').keypress(function (e) {
        var chr = String.fromCharCode(e.which);
        if (" ".indexOf(chr) >= 0)
            return false;
    })
})


function ConfirmUserAndEmail() {    

    var username = $('#inputUsername').val();
    var email = $('#inputEmail').val();
    var confirmEmail = $('#inputConfirmEmail').val();

    // Comprueba que no falten datos y sean correctos.
    if (username != "" && email != "" && confirmEmail != "") {        

        // Comprueba que la dirección de correo electrónico contenga un @
        if (email.indexOf("@") == -1) {
            alert("Introduzca una dirección de correo electrónico correcta.");
        }
        else {
            // Comprueba que las direcciones de correo electrónico sean iguales
            if (email == confirmEmail) {
                // Recupera los users que coincidan
                $.ajax({
                    url: '/Modules/Usuarios/WebServiceUsuarios.aspx',
                    dataType: 'text',
                    data:
                    {
                        checkUser: 'true',
                        username: username
                    },
                    success: function (data) {
                        if (data == "True") {
                            alert("Ya existe un usuario con ese nombre");
                        }
                        // Si no coinciden procede
                        else {
                            $('#emailHidden').val(email);
                            $('#userHidden').val(username);

                            // Siguiente stage
                            $('#stage1').hide('slow', function () { $('#stage2').show('slow'); });
                        }
                    }
                });
            }
            else {
                alert("Los correos electrónicos no coinciden.");
            }
        }        
    }
    else {
        alert("Falta rellenar algún campo.");
    }
}

// Registrar nuevo usuario
function ConfirmPassword() {
    var password = $('#inputPassword').val();
    var confirmPassword = $('#inputConfirmPassword').val();
    var user = $('#userHidden').val();
    var email = $('#emailHidden').val();

    if (password == "" && confirmPassword == "") {
        alert("Falta rellenar algún campo.");
    }
    else {
        if (password == confirmPassword) {

            // Coinciden credenciales
            $.ajax({
                url: '/Modules/Usuarios/WebServiceUsuarios.aspx',
                dataType: 'text',
                data:
                {
                    createUser: "true",
                    email: email,
                    password: password,
                    user: user,
                },
                success: function (data) {

                    if (data == "True") {
                        alert("Usuario creado con éxito.");
                    }
                    else {
                        alert("Eror inesperado. El usuario no pudo crearse. Contacte con el soporte.");
                    }
                },
            })
        }
        else {
            alert("Las contraseñas no coinciden.");
        }
    }    
}

// Botón volver
function Volver() {
    $('#stage2').hide('slow',
        function () {
            $('#stage1').show('slow');
        });

    // Limpiar los valores
    $('#inputPassword').val("");
    $('#inputConfirmPassword').val("");
    $('#userHidden').val("");
    $('#emailHidden').val("");
}
