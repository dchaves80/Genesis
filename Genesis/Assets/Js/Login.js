//  Datos correctos, procede a entrar a la página
//var Line;

function AccessGranted(data) {
    window.location.href = "/Pages/Main/Main.aspx?sk=" + data;
}

function LoadProgressBar() {

   /* Line = new ProgressBar.Circle('#progressbarContainer', {
        color: '#FCB03C',
        duration: 1500,
        easing: 'easeInOut',

    });

    Line.animate(0);*/
    
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


