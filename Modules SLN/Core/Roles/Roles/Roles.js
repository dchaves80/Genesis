// Definición de draggable
$(window).on('load', function () {
    

    $('.draggable').draggable({
        // Propiedades
        opacity: 0.5,
        revert: true,
        revertDuration: 500,
        start: function (event, ui) {
            
        },
        stop: function (event, ui) {
            
        }
    })
})



//                      //
//      TABLA ROLES     //
//                      //
//
// Obtiene todos los roles
function GetAllRoles() {
    $.ajax({
        url: '/Modules/Roles/WebServiceRoles.aspx',
        dataType: 'json',
        data:
        {
            getRoles: 'true',
        },
        success: function (data) {
            ReconstruirTabla();

            if (data != null) {
                for (a = 0; a < data.length; a++) {
                    $('#RolesTable').append(
                        "<tr>" +
                            "<td class='draggable'>" + data[a].ROLE + "</td>" +
                            "<td>" +
                                "<input class='ButtonDark' onclick='EditarRol(this)' value='Editar' type='button' />" +
                                "<input class='ButtonDark' value='Eliminar' type='button'/>" +
                                "<div style='position: relative; display: inline-block; opacity: 0;'>" +
                                    "<label style='display: inline-block; margin-right: 20px;' class='LabelInput'>" +
                                        "<input style='color: rgba(255,255,255,0.8)' placeholder='ej: Enfermerx' class='Input' type='text'/>" +
                                        "<span class='InputPlaceholderWrap'><span class='InputPlaceholder'>NUEVO ROL</span></span>" +
                                    "</label>" +
                                    "<input onclick='ConfirmarRolNuevo(this,\"" + data[a].ID + "\")' class='ButtonDark' value='✓' type='button'/>" +
                                    "<input type='button' class='ButtonDark' value='✕'/>" +
                                "</div>" +
                            "</td>" +
                        "</tr>");
                }
            }  
        }
    })
}
// Reconstruye la primera fila de la tabla
function ReconstruirTabla() {
    $('#RolesTable').empty();
    $('#RolesTable').append(
        "<tr class='TopRow'>" +
            "<th>ROL</th>" +
        "</tr>")
}

// Editar rol
function EditarRol(object) {
    $(object).siblings('div').animate(
        {
            opacity: '1',
            left: "+=25px",
        }, 500, function () {
            $(object).attr("disabled", "disabled");
            $(object).removeClass("ButtonDark");
            $(object).addClass("ButtonDarkDisabled");
            $('#Status').val("Editando");
        })
}
// Confirmar edición
function ConfirmarRolNuevo(object, id) {
    var label = $(object).siblings('label');
    var newRole = label.children('input').val();

    if (newRole != "" || newRole != " ") {
        $.ajax({
            url: '/Modules/Roles/WebServiceRoles.aspx',
            dataType: 'text', 
            data:
            {
                updateRole: 'true',
                newRole: newRole,
                id: id,
            },
            success: function (data) {
                if (data == "False")
                    alert("Hubo un error y no se pudo modificar el rol. Contacte con el soporte.");
                else {
                    alert("Se modificó el rol con éxito.");
                    GetAllRoles()
                }
                    
            }
        })
    }
    else
        alert("Falta rellenar el campo de texto.")
}