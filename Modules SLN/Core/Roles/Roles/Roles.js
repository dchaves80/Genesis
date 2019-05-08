///                     ///
///         LOAD        ///
///                     ///
$(window).on('load', function () {    

    CreateDragDrop();

    CreateEventHandler();
 
})

///                         ///
///         OTROS           ///
///                         ///
// Detect keypress
$(document).on("keypress", ".RoleName", function (e) {
    
    if (e.which == 13) {
        EditRole(this);
        GetAllRoles();
        GetAllUserRoles();
    }

    
    
});
// Creates the event handler for edit role button
function CreateEventHandler() {

    $('.RowRole').hover(
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
}


// Get a single role to edit
function GetRoleToEdit(object, idRole) {
    var tr = $(object).parent().parent();
    tr.removeClass("draggable");
    tr.empty();

    $.ajax({
        url: '/Modules/Roles/WebServiceRoles.aspx',
        dataType: 'json',
        data:
        {
            getRole: 'true',
            idRole: idRole,
        },
        success: function (data) {

            tr.append(
                "<td>" +
                    "<label class='InputTextDarkLabel'>" +
                        "<input idRole='" + data.ID + "' style='color: rgba(255,255,255,0.8)' placeholder='ej: Enfermerx' class='InputTextDark RoleName' type='text' value='" + data.ROLE + "'/>" +
                        "<span class='InputTextDarkPlaceholderWrap'> <span class='InputTextDarkPlaceholder'>" + data.ROLE + "</span> </span>" +
                    "</label>" +
                "</td>" +
                    
                "<td>" +
                    "<input type='button' class='ButtonDark' value='VOLVER' onclick='GetAllRoles()'/>" +
                "</td>");
        }
    })
}



// Get all roles from the table
function GetAllRoles() {
    $.ajax({
        url: '/Modules/Roles/WebServiceRoles.aspx',
        dataType: 'json',
        data:
        {
            getAllRoles: 'true',
        },
        success: function (data) {
            RebuildRolesTable();

            if (data != null) {
                for (a = 0; a < data.length; a++) {
                    $('#tablaRoles').append(
                        "<tr style='cursor: grab;' class='draggable RowRole TableRows' idRole=" + data[a].ID + ">" +
                            "<td>" + data[a].ROLE + "</td>" +
                            "<td>" + 
                                "<input style='opacity: 0;' type='button' class='ButtonDark' value='X' onclick='DeleteRole(" + data[a].ID + ")' />" +
                                "<input style='opacity: 0;' type='button' class='ButtonDark' value='EDITAR' onclick='GetRoleToEdit(this," + data[a].ID + ")' />" +
                            "</td>" +
                        "</tr>");
                }
                
            }
            CreateDragDrop();
            CreateEventHandler();
        }
    })
}

// Gets all users and roles associated
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

                RebuildUsersRolesTable();

                for (a = 0; a < data.length; a++) {

                    var listItems = "";
                    if (data[a].ROLES != undefined) {
                        for (i = 0; i < data[a].ROLES.length; i++) {
                            listItems += "<li><input type='button' class='ButtonDark' value='X' onclick='UnassignRole(\"" + data[a].ROLES[i].ID + "\",\"" + data[a].ID + "\")' /> " + data[a].ROLES[i].ROLE + " </li>";
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
            CreateDragDrop();
        }
    })
}


// Rebuild tables
function RebuildRolesTable() {
    $('#tablaRoles').empty();
    $('#tablaRoles').append(
        "<tr class='TopRow'>" +
            "<td>ROL</td>" +
        "</tr>");
}
function RebuildUsersRolesTable() {
    $('#tablaUsuariosRoles').empty();
    $('#tablaUsuariosRoles').append(
        "<tr class='TopRow'>" +
            "<td>USUARIO</td>" +
            "<td>ROL ASIGNADO</td>" +
        "</tr>");
}

// Creates the draggables and droppables objects
function CreateDragDrop() {

    /* Definition of drag and drop objects
     * Every object with '.draggable' and '.droppable'
     * class will be converted into draggable and droppable respectively.
     */

    $('.draggable').draggable({
        // Properties
        opacity: 0.5,
        revert: true,
        revertDuration: 500,
        
        // Executed when drag starts. Prevents visual bugs on <tr> objects
        start: function (event, ui) {
            ui.helper.removeClass("TableRows");
        },

        // Executed when drag stops (is dropped). Restore visual effects on <tr> objects
        stop: function (event, ui) {
            ui.helper.addClass("TableRows");
        }
    })

    $('.droppable').droppable({
        // Properties
        accept: ".draggable",
        tolerance: "pointer",
        // Executed at drop
        drop: function (event, ui) {

            idRole = ui.draggable.attr("idRole");
            AssignRole(idRole, $(this).attr("idUser"));
            
        },
    })
}

///                         ///
///         CREATE          ///
///                         ///
// Create role
function CreateRole(object) {    
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
///         ASSIGN          ///
///                         ///
// Assign role
function AssignRole(idRole, idUser) {    
    $.ajax({
        url: '/Modules/Roles/WebServiceRoles.aspx',
        dataType: 'text',
        data:
        {
            assignRole: 'true',
            idRole: idRole,
            idUser: idUser,
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
// Unassign role
function UnassignRole(idRole, idUser) {

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

            if (data == "True")                            
                GetAllUserRoles();            
            else
                alert("Hubo un error y no se pudo desasignar el rol. Contacte con el soporte.");
        }
    });
}

///                          ///
///         EDIT             ///
///                          ///

// Edit role
function EditRole(object) {

    var roleName = $(object).val();
    var idRole = $(object).attr("idRole");

    if (roleName != "") {
        $.ajax({
            url: '/Modules/Roles/WebServiceRoles.aspx',
            dataType: 'text',
            data:
            {
                editRole: 'true',
                idRole: idRole,
                roleName: roleName,
            },
            success: function (data) {
                if (data == "True") {

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
///         DELETE          ///
///                         ///
// Delete role
function DeleteRole(idRole) {
    
    $.ajax({
        url: '/Modules/Roles/WebServiceRoles.aspx',
        dataType: 'text',
        data:
        {
            deleteRole: 'true',
            idRole: idRole,
        },
        success: function (data) {
            if (data == "True") {

                GetAllRoles();
                GetAllUserRoles();
            }
            else
                alert("Hubo un error y no se pudo eliminar el rol. Contacte con el soporte.");
        }
    });    
}