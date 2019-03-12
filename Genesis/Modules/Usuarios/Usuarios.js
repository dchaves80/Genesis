// Siguiente stage
function ConfirmUserAndEmail() {
    var username = $('#inputUsername').val();
    var email = $('#inputEmail').val();
    var confirmEmail = $('#inputConfirmEmail').val()

    if (username != "" && email != "" && confirmEmail != "") {

        if (email == confirmEmail) {

            $('#emailHidden').val(email);
            $('#userHidden').val(username);

            //Access Granted
            $('#stage1').hide('slow', function () { $('#stage2').show('slow'); });

        }
        else {
            alert("Las direcciones de e-mail no coinciden.")
        }
    }
    else {
        alert("Falta rellenar algún campo.")
    }

}

function ConfirmPassword() {
    var password = $('#inputPassword').val();
    var confirmPassword = $('#inputConfirmPassword').val();
    var user = $('#userHidden').val();
    var email = $('#emailHidden').val();

    console.log(password + " " + confirmPassword + " " + user + " " + email);

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