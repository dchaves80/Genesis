///                     ///
///         LOAD        ///
///                     ///
$(window).on('load', function () {    

    CrearDragDrop();

    
    $('.draggable').hover(
        function () {
            $(this).children("td:last-child").children("input").animate(
                {
                    opacity: "1",
                }, 25);
        },
        function () {
            $(this).children("td:last-child").children("input").animate(
                {
                    opacity: "0",
                }, 25);
        });
    
})

///                         ///
///         OTROS           ///
///                         ///
$(document).on("keypress", ".RoleName", function (e) {
    
    if (e.which == 13) {
        EditarRol(this);
        GetAllRoles();
        GetAllUserRoles();
    }

    
    
});



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
                        "<tr style='cursor: grab;' class='draggable TableRows' action='assignRoleToUser' idRole=" + data[a].ID + ">" +
                            "<td>" +
                                "<label class='InputTextDarkLabel'>" +
                                    "<input idRol='" + data[a].ID + "' style='color: rgba(255,255,255,0.8)' placeholder='ej: Enfermerx' class='InputTextDark RoleName' type='text' value='" + data[a].ROLE + "'/>" +
                                    "<span class='InputTextDarkPlaceholderWrap'> <span class='InputTextDarkPlaceholder'>" + data[a].ROLE + "</span> </span>" +
                                "</label>" +
                            "</td>" +
                            "<td> <input type='button' class='ButtonDark' value='X' onclick='EliminarRol(" + data[a].ID + ")' />  </td>" +
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

            if (ui.draggable.attr("action") == "assignRoleToUser") {
                idRole = ui.draggable.attr("idRole");
                AsignarRol(idRole, $(this).attr("idUser"));
            }         
            if (ui.draggable.attr("action") == "assignModuleToRole") {
                idModule = ui.draggable.attr("idModule");
                AsignarModulo(idModule, $(this).attr("idRole"));
                
            }
        },
    })
}

///                         ///
///         CREAR           ///
///                         ///
// Crear Rol
function CrearRol(object) {    
    var input = $(object).siblings("label").children("input");   

    if (input.val() != "") {

        $.ajax({
            url: '/Modules/Roles/WebServiceRoles.aspx',
            dataType: 'text',
            data:
            {
                insertRole: 'true',
                newRole: input.val(),
            },
            success: function (data) {
                if (data == 'True') {
                    GetAllRoles();  
                    input.val("");
                }                                 
                else if (data == "False")
                    alert("Hubo un error y no se pudo crear el rol. Contacte con el soporte.");
                else
                    alert(data);
            }
        });
    }
    else
        alert("Inserte un nombre para continuar.");
}

///                         ///
///         ASIGNAR         ///
///                         ///
// Asignar rol
function AsignarRol(idRol, idUsuario) {    
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
            if (data == 'True')             
                GetAllUserRoles();    
                
            else if (data == "False")
                alert("Hubo un error y no se pudo asignar el rol. Contacte con el soporte.");

            else
                alert(data);
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
                //alert("Rol desasignado con éxito.");

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
                //alert("Usuario desasignado con éxito.");

                VerUsuariosAsociados();
            }
            else
                alert("Hubo un error y no se pudo desasignar el usuario. Contacte con el soporte.");
        }
    })

}

///                          ///
///         EDITAR           ///
///                          ///

// Editar rol
function EditarRol(object) {

    var nombreRol = $(object).val();
    var idRol = $(object).attr("idRol");

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

                    //alert("Rol editado con éxito.");

                    GetAllRoles();
                    GetAllUserRoles();                    
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
var imageDataArray = [];
var canvasCount = 35;
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

                //alert("Rol eliminado con éxito.");

                GetAllRoles();
                GetAllUserRoles();

                //VolverCrearRol();
            }
            else
                alert("Hubo un error y no se pudo eliminar el rol. Contacte con el soporte.");
        }
    });    
}








/* FUNCIONES QUE FALTAN
 * xEliminarRol(idRol)
 * xEditarRol(idRol)
 * xVolverCrearRol()
 * DesasignarUsuario()
 */



