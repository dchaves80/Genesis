//  Datos correctos, procede a entrar a la página
function AccessGranted(data) {
    window.location.href = "/Pages/Main/Main.aspx?sk=" + data;
}

//  Verifica las credenciales
function CheckUserPass() {

    var user = $('#inputUser').val()
    var pass = $('#inputPass').val()

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
                if (data != 'False') {
                    AccessGranted(data);

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


