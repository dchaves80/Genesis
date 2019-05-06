///                     ///
///         LOAD        ///
///                     ///
$(window).on('load', function () {

    CrearDragDrop();

})

///                         ///
///         OTROS           ///
///                         ///
$(document).on("keypress", ".RoleName", function (e) {

    if (e.which == 13) {
        EditarRol(this);
        GetAllRoles();
        GetAllModules();
    }


});



// Obtiene todos los roles
function GetAllRoles() {
    $.ajax({
        url: '/Modules/Permisos/WebServicePermisos.aspx',
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
                        "<tr style='cursor: grab;' class='draggable TableRows' action='assignRoleToModule' idRole=" + data[a].ID + ">" +
                        "<td>" + Role.ROLE + "</td>" +
                        "</tr>");
                }

            }
            CrearDragDrop();
        }
    })
}

// Obtener todos los modulos y roles asociados
function GetAllModules() {
    $.ajax({
        url: '/Modules/Permisos/WebServicePermisos.aspx',
        dataType: 'json',
        data:
        {
            getAllModules: 'true',
        },
        success: function (data) {

            if (data != null) {

                ReconstruirTablaModulos();

                for (a = 0; a < data.length; a++) {

                    var listItems = "";
                    if (data[a].ROLES != undefined) {
                        for (i = 0; i < data[a].ROLES.length; i++) {
                            listItems += "<li><input type='button' class='ButtonDark' value='X' onclick='DesasignarRol(\"" + data[a].ROLES[i].ID + "\",\"" + data[a].ID + "\")' /> " + data[a].ROLES[i].ROLE + " </li>";
                        }
                    }

                    $('#tablaModulos').append(
                        "<tr class='droppable TableRows' idModule='" + data[a].ID + "'>" +
                        "<td>" + data[a].NAME + "</td>" +
                        "<td>" +
                        "<ul  idModule='" + data[a].ID + "' style='list-style-type: none;'>" +
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


function ReconstruirTablaModulos() {
    $('#tablaModulos').empty();
    $('#tablaModulos').append(
        "<tr class='TopRow'>" +
        "<td>MODULO</td>" +
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

            if (ui.draggable.attr("action") == "assignRoleToModule") {
                idRole = ui.draggable.attr("idRole");
                AsignarRol(idRole, $(this).attr("idModule"));
            }
        },
    })
}


///                         ///
///         ASIGNAR         ///
///                         ///
// Asignar rol
function AsignarRol(idRol, idModule) {
    $.ajax({
        url: '/Modules/Permisos/WebServicePermisos.aspx',
        dataType: 'text',
        data:
        {
            assignRole: 'true',
            idRol: idRol,
            idModule: idModule,
        },
        success: function (data) {
            if (data == 'True')
                GetAllModules();

            else if (data == "False")
                alert("Hubo un error y no se pudo asignar el rol. Contacte con el soporte.");

            else
                alert(data);
        }
    });
}
// Desasignar un rol
function DesasignarRol(idRole, idModule) {


    $.ajax({
        url: '/Modules/Permisos/WebServicePermisos.aspx',
        dataType: 'text',
        data:
        {
            unassignRole: 'true',
            idModule: idModule,
            idRole: idRole,
        },
        success: function (data) {

            if (data == "True") {

                GetAllModules();
            }
            else
                alert("Hubo un error y no se pudo desasignar el rol. Contacte con el soporte.");
        }
    });
}