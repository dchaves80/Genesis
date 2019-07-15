//  Datos correctos, procede a entrar a la página
function AccessGranted(data) {
    window.location.href = "/Pages/Main/Main.aspx?sk=" + data;
}


$(document).keypress( function (event) {
    if (event.key == "Enter")
        CheckUserPass();
});


function checkAccessCookie()
{
    if (Cookies.get("user") != undefined && Cookies.get("pass") != undefined)
    {
        $('#inputUser').val(Cookies.get("user"));
        $('#inputPass').val(Cookies.get("pass"));
        CheckUserPass();
    }
}

//  Verifica las credenciales
function CheckUserPass() {
    
    var user = $('#inputUser').val();
    var pass = $('#inputPass').val();

    if (user != "" && pass != "") {

        $.ajax({
            
            url: 'Pages/Login/LoginWS.aspx',
            dataType: 'text',
            data:
                {
                    user: user,
                    pass: pass,
                },
            async: true,
            success: function (data) {
                if (data != 'False') {
                    if ($('#CheckRemember').is(":checked") == true) {
                        Cookies.set("user", user);
                        Cookies.set("pass", pass);
                    }
                    AccessGranted(data);
                }
                else {

                    alert("El usuario o contraseña ingresado no son correctos");
                }
            },
            
        })
    }
    else {
        alert('Falta rellenar algún campo');
    }
}


