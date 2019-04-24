//// Definición de draggable
////$(window).on('load', function () {    
////    $('.draggable').draggable({
////        // Propiedades
////        opacity: 0.5,
////        revert: true,
////        revertDuration: 500,
////        start: function (event, ui) {
            
////        },
////        stop: function (event, ui) {
            
////        }
////    })
////})

////var ocultables = [$('#RolesTableDiv'), $('#UsuariosTableDiv'), $('#AdminRolDiv') ]


//$(document).ready(function () {
//    // Definición del draggable y el droppable
//    $('.draggable').draggable({
//        // Propiedades
//        opacity: 0.5,
//        revert: true,
//        revertDuration: 500,
//        start: function (event, ui) {

//        },
//        stop: function (event, ui) {

//        }
//    })

//    $('.droppable').droppable({
//        // Propiedades
//        accept: ".draggable",
//        tolerance: "pointer",
//        // Función ejecutada al dropear el objeto
//        drop: function (event, ui) {
//            $.ajax({
//                url: '/Modules/Roles/WebServiceRoles.aspx',
//                dataType: 'text',
//                data:
//                {

//                }
//            })
//        },
//    })

//    $('.droppable').droppable('disable');
//    $('.draggable').draggable('disable');


//})


////                  //
////      BOTONES     //
////                  //
//// Abrir crear rol
//function AbrirCrearlRol(object) {
//    var crearRolDiv = $('#crearRolDiv');    
//    var thisButton = $(object);

//    $('#Status').val("Creating");

//    if (!crearRolDiv.is(":visible")) {
//        crearRolDiv.show('blind');
//        thisButton.val("OCULTAR");
//        // Por alguna razón esto comentado no anda    
//        //ocultables[1].hide('blind');
//        //ocultables[0].hide('blind', function () {  ocultables[2].hide('blind'); });
//        $('#RolesTableDiv').hide('blind', function () { $('#AdminRolDiv').hide('blind'); })

//    }
//    else {
//        crearRolDiv.hide('blind');
//        thisButton.val("CREAR ROL");
//        //ocultables[1].show('blind');
//        //ocultables[0].show('blind', function () { ocultables[2].show('blind'); });

//        $('#RolesTableDiv').show('blind', function () { $('#AdminRolDiv').show('blind'); })
//    }
//}
//// Abrir asignar roles
//function AbrirAsignarRol() {    
//    var usuariosDiv = $('#UsuariosTableDiv');

//    // Oculta este botón
//    $('#ocultarAsignarRol').removeAttr("disabled");
//    $('#asignarRolButton').attr("disabled", "disabled");
//    $('#asignarRolButton').hide('blind');

//    // Muestra el div y anima
//    usuariosDiv.css('display', 'inline-block');
//    usuariosDiv.animate(
//        {
//            opacity: '1',
//            left: '+=25px',
//        }, 500, function () { })

//    // Prepara las tablas
//    $('.TableRows').addClass("TableRowsDisabled");
//    $('.TableRows').removeClass("TableRows");
//    $('.editDiv').hide('slow');

//    // Activa los droppable y draggable
//    $('.droppable').droppable('enable');
//    $('.draggable').draggable('enable');
//}
//// Ocultar asignar roles
//function OcultarAsignarRol() {
//    var usuariosDiv = $('#UsuariosTableDiv');

//    // Muestra este botón
//    $('#ocultarAsignarRol').attr("disabled", "disabled");
//    $('#asignarRolButton').removeAttr("disabled");
//    $('#asignarRolButton').show('blind');

//    // Anima y oculta el div    
//    usuariosDiv.animate(
//        {
//            opacity: '1',
//            left: '-=25px',
//        }, 500, function () {
//            usuariosDiv.hide();
//        });

//    // Prepara las tablas
//    $('.TableRowsDisabled').addClass("TableRows");
//    $('.TableRowsDisabled').removeClass("TableRowsDisabled");
//    $('.editDiv').show('slow');

//    // Activa los droppable y draggable
//    $('.draggable').draggable('disable');
//    $('.droppable').droppable('disable');
//}
//// Asignar roles
////function AsignarRol(object) {

////    var thisButton = $(object);
////    var usuariosDiv = $('#UsuariosTableDiv');

////    // Si no es visible, lo muestra y activa el modo asignar
////    if (!usuariosDiv.is(':visible')) {

////        usuariosDiv.css('display', 'inline-block');
        

////        usuariosDiv.animate(
////            {
////                opacity: '1',
////                left: '+=25px',
////            }, 500, function () { })

////        $('.TableRows').addClass("TableRowsDisabled");
////        $('.TableRows').removeClass("TableRows");

////        thisButton.val("OCULTAR USUARIOS");

        

////        $('.droppable').droppable('enable');
////        $('.draggable').draggable('enable');
////    }
////    // Si está visible, entonces desactiv el modo asignar
////    else {

////        usuariosDiv.animate(
////            {
////                opacity: '0',
////                left: '-=25px',
////            }, 500, function () {
////                usuariosDiv.hide();
////                })

////        $('.TableRowsDisabled').addClass("TableRows");
////        $('.TableRowsDisabled').removeClass("TableRowsDisabled");

////        $('.draggable').draggable('disable');
////        $('.droppable').droppable('disable');

////        thisButton.val("ASIGNAR");
////    }
////}

////                      //
////      CREAR ROL       //
////                      //
//// Crear rol
//function CrearRol() {
//    var nombreRol = $('#nuevoRolText').val();

//    if (nombreRol != null) {
//        $.ajax({
//            url: '/Modules/Roles/WebServiceRoles.aspx',
//            dataType: 'text',
//            data:
//            {
//                insertRole: 'true',
//                newRole: nombreRol,
//            },
//            success: function (data) {
//                if (data == "True") {
//                    alert("Rol creado con éxito.");
//                    GetAllRoles();
//                }
//                else
//                    alert("Hubo un error y no se pudo crear el rol. Contacte con el soporte.");
//            }
//        })
//    }
//    else
//        alert("Falta rellenar un campo.");
//}

////                      //
////      TABLA ROLES     //
////                      //
//// Obtiene todos los roles
//function GetAllRoles() {
//    $.ajax({
//        url: '/Modules/Roles/WebServiceRoles.aspx',
//        dataType: 'json',
//        data:
//        {
//            getRoles: 'true',
//        },
//        success: function (data) {
//            ReconstruirTabla();

//            if (data != null) {
//                for (a = 0; a < data.length; a++) {
//                    $('#RolesTable').append(
//                        "<tr class='TableRows'>" +
//                            "<td class='draggable'>" + data[a].ROLE + "</td>" +
//                            "<td class='editDiv'>" +
//                                "<input class='ButtonDark' onclick='EditarRol(this)' value='Editar' type='button' />" +
//                                "<input class='ButtonDark' onclick='EliminarRol(\"" + data[a].ID + "\",\"" + data[a].ROLE + "\")' value='Eliminar' type='button'/>" +
//                                "<div style='position: relative; display: none; opacity: 0;'>" +
//                                    "<label style='display: inline-block; margin-right: 20px;' class='LabelInput'>" +
//                                         "<input style='color: rgba(255,255,255,0.8)' placeholder='ej: Enfermerx' class='Input' type='text'/>" +
//                                            "<span class='InputPlaceholderWrap'><span class='InputPlaceholder'>NUEVO ROL</span></span>" +
//                                    "</label>" +
//                                    "<input style='margin-right: 10px;' onclick='ConfirmarRolEdit(this,\"" + data[a].ID + "\")' class='ButtonDark' value='✓' type='button'/>" +
//                                        "<input style='margin-right: 10px;' onclick='CancelEditing(this)' type='button' class='ButtonDark' value='✕'/>" +
//                                "</div>" +
//                            "</td>" +
//                        "</tr>");
//                }
//                $('.draggable').draggable({
//                    // Propiedades
//                    opacity: 0.5,
//                    revert: true,
//                    revertDuration: 500,
//                    start: function (event, ui) {

//                    },
//                    stop: function (event, ui) {

//                    }
//                })
//            }  
//        }
//    })
//}
//// Reconstruye la primera fila de la tabla
//function ReconstruirTabla() {
//    $('#RolesTable').empty();
//    $('#RolesTable').append(
//        "<tr class='TopRow'>" +
//            "<th>ROL</th>" +
//        "</tr>")
//}



////                          //
////      BOTONES TABLA       //
////                          //
//// Editar rol
//function EditarRol(object) {
//    $(object).attr("disabled", "disabled");

//    var editarDiv = $(object).siblings('div');
//    editarDiv.css('display', 'inline-block');

//    editarDiv.animate(
//        {
//            opacity: '1',
//            left: "+=25px",
//        }, 500, function () {  
//            $(object).removeClass("ButtonDark");
//            $(object).addClass("ButtonDarkDisabled");
//            $('#Status').val("Editando");
//        })
//}
//// Cancelar editar
//function CancelEditing(object) {
//    var editarDiv = $(object).parent('div');
//    var button = editarDiv.siblings('input');    

//    //div.hide('slow');
//    editarDiv.animate(
//        {
//            opacity: "0",
//            left:"-=25px",
//        }, 500, function () {
//            editarDiv.hide();
//            $(button).removeAttr("disabled");
//            $(button).removeClass("ButtonDarkDisabled");
//            $(button).addClass("ButtonDark");
//    })
    

//    $('#Status').val("");
//}
//// Confirmar edición
//function ConfirmarRolEdit(object, id) {
//    var label = $(object).siblings('label');
//    var newRole = label.children('input').val();

//    if (newRole != "" || newRole != " ") {
//        $.ajax({
//            url: '/Modules/Roles/WebServiceRoles.aspx',
//            dataType: 'text',
//            data:
//            {
//                updateRole: 'true',
//                newRole: newRole,
//                id: id,
//            },
//            success: function (data) {
//                if (data == "False")
//                    alert("Hubo un error y no se pudo modificar el rol. Contacte con el soporte.");
//                else {
//                    alert("Se modificó el rol con éxito.");
//                    GetAllRoles();
//                    $('#Status').val("");
//                }

//            }
//        })
//    }
//    else
//        alert("Falta rellenar el campo de texto.");
//}
//// Eliminar Rol
//function EliminarRol(roleId, role) {
//    $.ajax({
//        url: '/Modules/Roles/WebServiceRoles.aspx',
//        dataType: 'text',
//        data:
//        {
//            deleteRole: 'true',
//            id: roleId,
//            role: role,
//        },
//        success: function (data) {
//            if (data == "True") {
//                alert('Role eliminado con éxito');
//                GetAllRoles();
//                ReconstruirTabla();
//            }
//            else
//                alert("Hubo un error y no se pudo eliminar el rol. Contacte con el soporte.")                
//        }
//    })
//}

////                  //
////      OTROS       //
////                  //


///                     ///
///         LOAD        ///
///                     ///
$(window).on('load', function () {    

    CrearDragDrop();
    
})

///                         ///
///         OTROS           ///
///                         ///
// Obtiene todos los roles
function GetAllRoles() {
    $.ajax({
        url: '/Modules/Roles/WebServiceRoles.aspx',
        dataType: 'json',
        data:
        {
            getAllRoles: 'true',
        },
        success: function (data) {
            ReconstruirTablaRoles();

            if (data != null) {
                for (a = 0; a < data.length; a++) {
                    $('#tablaRoles').append(
                        "<tr style='cursor: pointer;' class='draggable TableRows' idRole=" + data[a].ID + ">" +
                            "<td>" + data[a].ROLE + "</td>" +
                            "<td> <input type='button' class='ButtonDark' value='EDITAR' onclick='AbrirEditarRol(\"" + data[a].ID + "\")' /> </td>" +
                        "</tr>");
                }
                
            }
            CrearDragDrop();
        }
    })
}

// Obtener todos los usuarios y roles asociados
function GetAllUserRoles() {
    $.ajax({
        url: '/Modules/Roles/WebServiceRoles.aspx',
        dataType: 'json',
        data:
        {
            getAllUsersRoles: 'true',
        },
        success: function (data) {

            if (data != null) {

                ReconstruirTablaUsuariosRoles();

                for (a = 0; a < data.length; a++) {

                    var listItems = "";
                    if (data[a].ROLES != undefined) {
                        for (i = 0; i < data[a].ROLES.length; i++) {
                            listItems += "<li><input type='button' class='ButtonDark' value='X' onclick='DesasignarRol(\"" + data[a].ROLES[i].ID + "\",\"" + data[a].ID + "\")' /> " + data[a].ROLES[i].ROLE + " </li>";
                        }
                    }
                    
                    $('#tablaUsuariosRoles').append(
                        "<tr class='droppable TableRows' idUser='" + data[a].ID + "'>" +
                            "<td>" + data[a].USERNAME + "</td>" +
                            "<td>" +
                                "<ul  idUser='" + data[a].ID + "' style='list-style-type: none;'>" +
                                    listItems +
                                "</ul>" +
                            "</td>" +
                        "</tr>");

                }
            }
            CrearDragDrop();
        }
    })
}

// Obtener todos los usuarios de un rol determinado
function VerUsuariosAsociados(idRol) {

    var tablaDiv = $('#tablaUsuariosAsociados');
    var tabla = tablaDiv.children("table");
   
    $.ajax({
        url: '/Modules/Roles/WebServiceRoles.aspx',
        dataType: 'json',
        data:
        {
            getAllUsersAssociated: 'true',
            idRol: idRol,
        },
        success: function (data) {

            if (data != null) {
                tabla.empty()
                tabla.append(
                    "<tr class='TopRow'> <th>USUARIO</th> </tr>");

                for (a = 0; a < data.length; a++) {

                    tabla.append(
                        "<tr class='TableRows'>" +
                            "<td> <input type='button' class='ButtonDark' value='X' onclick='DesasignarUsuario(\"" + idRol + "\", \"" + data[a].ID + "\")' /> " + data[a].USERNAME + " </td>" +
                        "</tr> ");
                }
            }
        }
    })
    tablaDiv.show('blind');
}

// Reconstruir tablas
function ReconstruirTablaRoles() {
    $('#tablaRoles').empty();
    $('#tablaRoles').append(
        "<tr class='TopRow'>" +
            "<td>ROL</td>" +
        "</tr>");
}
function ReconstruirTablaUsuariosRoles() {
    $('#tablaUsuariosRoles').empty();
    $('#tablaUsuariosRoles').append(
        "<tr class='TopRow'>" +
            "<td>USUARIO</td>" +
            "<td>ROL ASIGNADO</td>" +
        "</tr>");
}

// Crea los draggable y droppable
function CrearDragDrop() {

    /* Definición del draggable en todos
     * los objetos con la clase draggable
     * y droppable
    */

    $('.draggable').draggable({
        // Propiedades
        opacity: 0.5,
        revert: true,
        revertDuration: 500,

        // Previene el bug visual al draggear la <tr>
        start: function (event, ui) {
            ui.helper.removeClass("TableRows");
        },

        stop: function (event, ui) {
            ui.helper.addClass("TableRows");
        }
    })

    $('.droppable').droppable({
        // Propiedades
        accept: ".draggable",
        tolerance: "pointer",
        // Función ejecutada al dropear el objeto
        drop: function (event, ui) {

            idRole = ui.draggable.attr("idRole");
            //idUsuario = $(this).

            AsignarRol(idRole, $(this).attr("idUser"));

        },
    })
}

///                         ///
///         CREAR           ///
///                         ///
// Crear Rol
function CrearRol(object) {    
    var nombreRol = $(object).siblings("label").children("input").val();

    console.log(nombreRol);

    if (nombreRol != "") {
        
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
                    alert("Rol creado con éxito");
                    GetAllRoles();
                }
                else
                    alert("Hubo un error y no se pudo crear el rol. Contacte con el soporte.");
            }
        });
    }
}

///                         ///
///         ASIGNAR         ///
///                         ///
// Asignar rol
function AsignarRol(idRol, idUsuario) {
    console.log(idRol, idUsuario);
    $.ajax({
        url: '/Modules/Roles/WebServiceRoles.aspx',
        dataType: 'text',
        data:
        {
            assignRole: 'true',
            idRol: idRol,
            idUsuario: idUsuario,
        },
        success: function (data) {
            if (data != null) {

                alert("Rol asignado con éxito");

                GetAllUserRoles();
            }
            else
                alert("Hubo un error y no se pudo asignar el rol. Contacte con el soporte.");
        }
    });
}
// Desasignar un rol
function DesasignarRol(idRole, idUser) {


    $.ajax({
        url: '/Modules/Roles/WebServiceRoles.aspx',
        dataType: 'text',
        data:
        {
            unassignRole: 'true',
            idUser: idUser,
            idRole: idRole,
        },
        success: function (data) {

            if (data == "True") {
                alert("Rol desasignado con éxito.");

                GetAllUserRoles();
            }
            else
                alert("Hubo un error y no se pudo desasignar el rol. Contacte con el soporte.");
        }
    });
}

// Desasignar usuario de un rol
function DesasignarUsuario(idRol, idUser) {

    $.ajax({
        url: '/Modules/Roles/WebServiceRoles.aspx',
        dataType: 'text',
        data:
        {
            unassignUser: 'true',
            idUser: idUser,
            idRole: idRol,
        },
        success: function (data) {
            if (data == "True") {
                alert("Usuario desasignado con éxito.");

                VerUsuariosAsociados();
            }
            else
                alert("Hubo un error y no se pudo desasignar el usuario. Contacte con el soporte.");
        }
    })

}

///                               ///
///         EDITAR/CREAR          ///
///                               ///
// Abrir el div de Editar Rol
function AbrirEditarRol(idRol) {

    var editar = $('#editarDiv');
    var crear = $('#crearDiv');

    $.ajax({
        url: '/Modules/Roles/WebServiceRoles.aspx',
        dataType: 'json',
        data:
        {
            getRole: 'true',
            idRol: idRol,

        },
        success: function (data) {

            editar.empty()

            if (data != null) {
                editar.append(
                    "<div>" +
                        "<input type='button' class='ButtonDark' value='ATRÁS' onclick='VolverCrearRol()'/>" +
                        "<br/>" +
                        "<h2 style='display: inline;'>" + data.ROLE + "</h2>" +
                        "<input type='button' class='ButtonDark' value='ELIMINAR' onclick='EliminarRol(\"" + data.ID + "\")' style='margin-left: 20px;' />" +
                        "<label style='display: inline-block; margin-right: 20px; margin-top: 20px;' class='InputTextDarkLabel'>" +
                            "<input style='color: rgba(255,255,255,0.8)' placeholder='ej: Enfermerx' class='InputTextDark' type='text' />" +
                            "<span class='InputTextDarkPlaceholderWrap'><span class='InputTextDarkPlaceholder'>NUEVO NOMBRE</span></span>" +
                        "</label>" +
                        "<input type='button' class='ButtonDark' value='GUARDAR' onclick='EditarRol(this, \"" + data.ID + "\")'/>" +
                        "<br />" +                        
                    "</div>" +
                    "<div style='margin-top: 50px;'>" +
                        "<input type='button' class='ButtonDark' value='VER USUARIOS ASOCIADOS' onclick='VerUsuariosAsociados(\"" + data.ID + "\")' />" +
                        "<div id='tablaUsuariosAsociados' style='display: none;'>" +
                            "<table style='margin-top: 40px;' class='Table'>" +
                                "<tr class='TopRow'> <th>USUARIO</th> </tr>" +
                            "</table>" +
                        "</div>" +
                    "</div>");
            }

            crear.hide('blind', function () {
                editar.show('blind');
            });            
        }
    });
}
// Volver a crear rol
function VolverCrearRol() {

    var editar = $('#editarDiv');
    var crear = $('#crearDiv');

    GetAllRoles();
    GetAllUserRoles();

    editar.hide('blind', function () {
        crear.show('blind');
    });
}
// Editar rol
function EditarRol(object, idRol) {
    var nombreRol = $(object).siblings("label").children("input").val();

    if (nombreRol != "") {
        $.ajax({
            url: '/Modules/Roles/WebServiceRoles.aspx',
            dataType: 'text',
            data:
            {
                editRole: 'true',
                idRol: idRol,
                roleName: nombreRol,
            },
            success: function (data) {
                if (data == "True") {

                    alert("Rol editado con éxito.");

                    GetAllRoles();
                    GetAllUserRoles();

                    VolverCrearRol();
                }
                else
                    alert("Hubo un error y no se pudo eliminar el rol. Contacte con el soporte.");
            }

        })
    }
    else
        alert("Inserte un nombre nuevo para el rol.");
}

///                         ///
///         ELIMINAR        ///
///                         ///
// Eliminar rol
function EliminarRol(idRol) {
    $.ajax({
        url: '/Modules/Roles/WebServiceRoles.aspx',
        dataType: 'text',
        data:
        {
            deleteRole: 'true',
            idRol: idRol,
        },
        success: function (data) {
            if (data == "True") {

                alert("Rol eliminado con éxito.");

                GetAllRoles();
                GetAllUserRoles();

                VolverCrearRol();
            }
            else
                alert("Hubo un error y no se pudo eliminar el rol. Contacte con el soporte.");
        }
    });
}






/* FUNCIONES QUE FALTAN
 * xEliminarRol(idRol)
 * xEditarRol(idRol)
 * VerUsuariosAsociados(idRol)
 * xVolverCrearRol()
 * DesasignarUsuario()
 */



