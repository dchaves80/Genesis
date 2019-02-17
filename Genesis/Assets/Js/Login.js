//  Datos correctos, procede a entrar a la página
function AccessGranted() {
    window.location.href = "/Pages/Main/Main.aspx";
}

//  Verifica las credenciales
function CheckUserPass() {

    var user = $('#inputUser').val()
    var pass = $('#inputPass').val()

    console.log(user + " " + pass);

    if (user != "" && pass != "") {

        $.ajax({
            url: 'Pages/Login/LoginWS.aspx',
            dataType: 'text',
            data:
            {
                user: user,
                pass: pass,
            },
            success: function (data) {
                if (data == 'True') {
                    AccessGranted();

                }
                else {
                    alert("El usuario o contraseña ingresado no son correctos");
                }
            }
        })
    }
    else {
        alert('Falta rellenar algún campo');
    }
}