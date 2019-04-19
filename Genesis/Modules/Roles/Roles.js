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
// Get All Roles
function GetAllRoles() {
    $.ajax({
        url: '/Modules/Roles/WebServiceRoles.aspx',
        dataType: 'json',
        data:
        {
            getAllRoles: 'true',
        },
        success: function (data) {
            ReconstruirTabla();

            if (data != null) {
                for (a = 0; a < data.length; a++) {
                    $('#tablaRoles').append(
                        "<tr class='draggable TableRows' idRole=" + data[a].ID + ">" +
                            "<td>" + data[a].ROLE + "</td>" +
                        "</tr>");
                }
                
            }
        }
    })
}

// ReconstruirTala
function ReconstruirTabla() {
    $('#tablaRoles').empty();
    $('#tablaRoles').append(
        "<tr class='TopRow'>" +
            "<td>ROL</td>" +
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

            console.log("Intento de añadir rol");

        },
    })
}

///                         ///
///         CREAR           ///
///                         ///
// Crear Rol
function CrearRol(object) {    
    var nombreRol = $(object).siblings("label").children("input").val();

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





