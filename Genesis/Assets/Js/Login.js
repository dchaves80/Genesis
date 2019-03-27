//  Datos correctos, procede a entrar a la página
var Line;

function AccessGranted(data) {
    window.location.href = "/Pages/Main/Main.aspx?sk=" + data;
}

function LoadProgressBar() {

    Line = new ProgressBar.Line('#progressbarContainer', {
        color: '#FCB03C',
        duration: 1000,
        easing: 'easeInOut'
    });

    Line.animate(0);

}

//  Verifica las credenciales
function CheckUserPass() {

    var user = $('#inputUser').val();
    var pass = $('#inputPass').val();

    if (user != "" && pass != "") {

        $.ajax({
            xhr: function ()
            {
                var XHR = $.ajaxSettings.xhr();
                XHR.onprogress = function e(evt)
                {
                    // For downloads
                    if (evt.lengthComputable) {
                        var CompProgress = evt.loaded / evt.total;
                        Line.animate(CompProgress);
                    }
                }
                return XHR;
            },
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


