<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Permisos.ascx.cs" Inherits="Permisos.Permisos" %>

<!-- ROLES -->
<h1>PERMISOS</h1>

<!-- CONTENT -->
<div>     
            <!-- Tabla roles-->
            <table id="tablaRoles" class="Table" style="display: inline;">
                <tr class="TopRow">
                    <td>ROL</td>
                </tr>

                <%                    

                    List<Models.Mod_Roles> LMR = Models.Mod_Roles.Get_All();

                    if (LMR != null && LMR.Count > 0)
                    {
                        foreach (Models.Mod_Roles Role in LMR)
                        {
                            if (Role.ROLE != "SuperUser")
                            {
                            Response.Write(
                                "<tr  style='cursor: grab;' class='draggable TableRows' action='assignRoleToUser' idRole=" + Role.ID + ">" +
                                    "<td>" + Role.ROLE + "</td>"  +
                                "</tr>");
                            }
                        }
                    }
                    else
                        Response.Write("<tr><td>Todavía no hay ningún rol creado.</td></tr>");
                    %>
            </table>



            <!-- Tabla Modulos -->
            <table id="tablaModulos" class="Table" style="display: inline; margin-left: 50px;">
                <tr class="TopRow">
                    <td>MODULO</td>
                    <td>ROL ASIGNADO</td>
                </tr>
                    <%

                        List<Models.Mod_Modules> LMU = Models.Mod_Modules.Get_All();

                        if (LMU != null && LMU.Count > 0)
                        {
                            foreach (Models.Mod_Modules Module in LMU)
                            {

                                string listItems = "";
                                if (Module.ROLES != null && Module.ROLES.Count > 0)
                                {

                                    foreach (Models.Mod_Roles Roles in Module.ROLES)
                                    {
                                        if (Roles.ROLE != "SuperUser")
                                        {
                                            listItems += "<li> <input type='button' class='ButtonDark' value='X' onclick='DesasignarRol(\"" + Roles.ID + "\",\"" + Module.ID + "\")' /> " + Roles.ROLE + " </li>";
                                        }
                                    }
                                }

                                Response.Write(
                                    "<tr class='droppable TableRows' idUser='" + Module.ID + "'>" +
                                        "<td>" + Module.NAME + "</td>" +
                                        "<td>" +
                                            "<ul idUser='" + Module.ID + "' style='list-style-type: none;'>" +
                                                listItems +
                                            "</ul>" +
                                        "</td>" +
                                    "</tr>");

                                listItems = "";
                            }
                        }

                    %>                
            </table>

        </div>
    </div>
     
</div>



<!-- POP UPS -->
<div>

</div>

<!-- HIDDENS -->
<div>

    <!-- Usado para verificar-->
    <input type="hidden" id="Status" />

</div>