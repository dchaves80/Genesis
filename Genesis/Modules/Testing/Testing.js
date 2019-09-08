
$(window).on('load', function () {

    //a = new HTMLTable("pedro", "2", "roles", "username");
    //b = new AjaxRequest("Testing");

    x = [{ "ID": 1, "USERNAME": "a", "EMAIL": "a@a.com", "PASSWORD": "0cc175b9c0f1b6a831c399e269772661", "ROLES": [{ "ID": 1, "ROLE": "SuperUser" }] }];

    /*
    
    c = new AjaxRequest("Testing")
    d = new HTMLTable("Testing", "table1", "id", "username", "roles")

    c.FillTable( { usr: 'losha', pw: 'losh'}, d)      
      
     */
    
})

class AjaxRequest {

    constructor(module) {        
        
        this.module = module;
    }

    FillTable(ajaxData, table) {
        
        $.ajax({
            url: '/Modules/' + this.module + '/WebService' + this.module + '.aspx',
            dataType: 'json',
            data:
            {
                ajaxData                
            },
            success: function (data) {                
                
                if (data != "null") {
                    table.Recreate();

                    for (const obj in data)
                        table.tbody.append(Utils.CreateRow(data[obj], table.rows));

                    console.log("Ajax status: Success");
                }
                else 
                    console.log("Ajax status: Error retrieving data");                                                      
                                                                          
            }
        })        
    }

    Insert(ajaxData) {

        $.ajax({
            url: '/Modules/' + this.module + '/WebService' + this.module + '.aspx',
            dataType: 'text',
            data:
            {
                ajaxData
            },
            success: function (data) {
                
                if (data == "True") {

                    // Success
                    console.log("Ajax status: Success");

                }
                else {

                    // Error
                    console.log("Ajax status: Error sending/posting data");

                }
            }
        })

        return result;
    }
}

class HTMLTable {

    constructor(module, id) {   

        // Gets the args representing rows.
        var rowArgs = Array.prototype.slice.call(arguments, 2);

        if (rowArgs.length > 0) {

            this.module = module;
            this.id = id;
            this.obj = $("#" + id);

            this.tbody = this.obj.children();    // Gets the body from the table.

            this.rows = [];

            // Fills the rows with the args.
            for (const i in rowArgs) 
                this.rows.push(rowArgs[i]);                            
        }
        else
            console.log("Error: not specified any row");    
    }
                                
    Recreate() {
        
        var topRows = "<tr class='TopRow'>";

        for (const i in this.rows) {

            // Recreates the string structure of the table.
            topRows += "<td>" + this.rows[i][0].toUpperCase() + this.rows[i].substring(1) + "</td>";     
        }
        topRows += "</tr>"         

        this.tbody.empty();
        this.tbody.append(topRows);
    }
}

class Utils {

    // Creates table's rows string.
    static CreateRow(data, rowsAllowed) {

        let row = "<tr>";
        rowsAllowed = rowsAllowed.map(z => z.toUpperCase()); // Converts to uppercase for further comparison.

        for (const prop in data) {

            if (rowsAllowed.includes(prop)) { // Checks if the data should be displayed.

                if (typeof data[prop] == "object") {

                    row += "<td><ul style='list-style-type: none;'>";

                    for (const object in data[prop])

                        for (const objProp in data[prop][object])

                            if (objProp != "ID")

                                row += "<li>" + data[prop][object][objProp] + "</li>";

                    row += "</ul></td>";
                }
                else
                    row += "<td>" + data[prop] + "</td>";
            }
        }
        row += "</tr>";
        return row;
    }

    // Creates the draggables and droppables objects
    static CreateDragDrop(dropFunction) {

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

                ui.helper.parent().parent().addClass("Table");
                ui.helper.parent().parent().removeClass("TableDark");
                
            },
            // Executed when drag stops (is dropped). Restore visual effects on <tr> objects
            stop: function (event, ui) {

                ui.helper.parent().parent().addClass("TableDark");
                ui.helper.parent().parent().removeClass("Table");                
                
            }
        });

        $('.droppable').droppable({

            // Properties
            accept: ".draggable",
            tolerance: "pointer",

            // Executed at drop
            drop: function (event, ui) {

                dropFunction();

            },
        });
    }
}



// Get a single role to edit
function GetRoleToEdit(object, idRole) {
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