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

//                  //
//      BOTONES     //
//                  //
// Abrir crear rol
function AbrirCrearlRol(object) {
    var crearRolDiv = $('#crearRolDiv');
    var tablaDiv = $('#RolesTableDiv');
    var thisButton = $(object);

    if (!crearRolDiv.is(":visible")) {
        crearRolDiv.show('blind');
        thisButton.val("OCULTAR");
        tablaDiv.hide('blind');
    }
    else {
        crearRolDiv.hide('blind');
        thisButton.val("CREAR ROL");
        tablaDiv.show('blind');
    }
}

//                      //
//      CREAR ROL       //
//                      //
// Crear rol
function CrearRol() {
    var nombreRol = $('#nuevoRolText').val();

    if (nombreRol != null) {
        $.ajax({
            url: '/Modules/Roles/WebServiceRoles.aspx',
            dataType: 'text',
            data:
            {
                insertRole: 'true',
                newRole: nombreRol,
            },
            success: function (data) {
                if (data == "True") {
                    alert("Rol creado con éxito.");
                    GetAllRoles();
                }
                else
                    alert("Hubo un error y no se pudo crear el rol. Contacte con el soporte.");
            }
        })
    }
    else
        alert("Falta rellenar un campo.");
}

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
                                "<input class='ButtonDark' onclick='EliminarRol(\"" + data[a].ID + "\",\"" + data[a].ROLE + "\")' value='Eliminar' type='button'/>" +
                                "<div style='position: relative; display: inline-block; opacity: 0;'>" +
                                    "<label style='display: inline-block; margin-right: 20px;' class='LabelInput'>" +
                                         "<input style='color: rgba(255,255,255,0.8)' placeholder='ej: Enfermerx' class='Input' type='text'/>" +
                                            "<span class='InputPlaceholderWrap'><span class='InputPlaceholder'>NUEVO ROL</span></span>" +
                                    "</label>" +
                                    "<input style='margin-right: 10px;' onclick='ConfirmarRolEdit(this,\"" + data[a].ID + "\")' class='ButtonDark' value='✓' type='button'/>" +
                                        "<input style='margin-right: 10px;' onclick='CancelEditing(this)' type='button' class='ButtonDark' value='✕'/>" +
                                "</div>" +
                            "</td>" +
                        "</tr>");
                }
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

//                          //
//      BOTONES TABLA       //
//                          //
// Editar rol
function EditarRol(object) {
    $(object).attr("disabled", "disabled");
    $(object).siblings('div').animate(
        {
            opacity: '1',
            left: "+=25px",
        }, 500, function () {            
            $(object).removeClass("ButtonDark");
            $(object).addClass("ButtonDarkDisabled");
            $('#Status').val("Editando");
        })
}
// Cancelar editar
function CancelEditing(object) {
    var div = $(object).parent('div');
    var button = div.siblings('input');

    //div.hide('slow');
    div.animate(
        {
            opacity: "0",
            left:"-=25px",
        }, 500, function () {
            $(button).removeAttr("disabled");
            $(button).removeClass("ButtonDarkDisabled");
            $(button).addClass("ButtonDark");
    })
    

    $('#Status').val("");
}
// Confirmar edición
function ConfirmarRolEdit(object, id) {
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
                    GetAllRoles();
                    $('#Status').val("");
                }
                    
            }
        })
    }
    else
        alert("Falta rellenar el campo de texto.")
}
// Eliminar Rol
function EliminarRol(roleId, role) {
    $.ajax({
        url: '/Modules/Roles/WebServiceRoles.aspx',
        dataType: 'text',
        data:
        {
            deleteRole: 'true',
            id: roleId,
            role: role,
        },
        success: function (data) {
            if (data == "True") {
                alert('Role eliminado con éxito');
                GetAllRoles();
                ReconstruirTabla();
            }
            else
                alert("Hubo un error y no se pudo eliminar el rol. Contacte con el soporte.")                
        }
    })
}
