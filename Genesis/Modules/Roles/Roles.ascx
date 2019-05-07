<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Roles.ascx.cs" Inherits="Roles.Roles" %>

<!-- ROLES -->
<h1>ROLES</h1>

<!-- CONTENT -->
<div>     

    <!-- Modo crear -->
    <div id="crearDiv">
        <!-- Controles de usuario -->
        <div style="margin-bottom: 50px;">

            <label style='display: inline-block; margin-right: 20px; margin-top: 20px;' class='InputTextDarkLabel'>
                <input style='color: rgba(255,255,255,0.8)' placeholder='ej: Enfermerx' class='InputTextDark' type='text' />
                <span class='InputTextDarkPlaceholderWrap'><span class='InputTextDarkPlaceholder'>NUEVO ROL</span></span>
            </label>

            <input type="button" class="ButtonDark" value="CREAR" onclick="CrearRol(this)" />

        </div>

        <!-- Tablas de usuarios/roles -->
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
                            Response.Write(
                                "<tr  style='cursor: grab;' class='draggable RowRole TableRows' action='assignRoleToUser' idRole=" + Role.ID + ">" +
                                    "<td>" + Role.ROLE +
                                    //"<label class='InputTextDarkLabel'>" +
                                    //    "<input idRol='" + Role.ID + "' style='color: rgba(255,255,255,0.8)' placeholder='ej: Enfermerx' class='InputTextDark RoleName' type='text' value='" + Role.ROLE + "'/>" +
                                    //    "<span class='InputTextDarkPlaceholderWrap'> <span class='InputTextDarkPlaceholder'>" + Role.ROLE + "</span> </span>" +
                                    //"</label>" +
                                        
                                    "</td>" +
                                    "<td>" + 
                                        "<input style='opacity: 0;' type='button' class='ButtonDark' value='X' onclick='EliminarRol(" + Role.ID + ")' />" +
                                        "<input style='opacity: 0;' class='ButtonDark' type='button' value='EDITAR' onclick='GetRoleToEdit(this," + Role.ID + ")'/>" +
                                    "</td>" +
                                "</tr>");
                        }
                    }
                    else
                        Response.Write("<tr><td>Todavía no hay ningún rol creado.</td></tr>");
                    %>
            </table>



            <!-- Tabla usuarios -->
            <table id="tablaUsuariosRoles" class="Table" style="display: inline; margin-left: 50px;">
                <tr class="TopRow">
                    <td>USUARIO</td>
                    <td>ROL ASIGNADO</td>
                </tr>
                    <%

                        List<Models.Mod_Users> LMU = Models.Mod_Users.Get_All();

                        if (LMU != null && LMU.Count > 0)
                        {
                            foreach (Models.Mod_Users User in LMU)
                            {

                                string listItems = "";
                                if (User.ROLES != null && User.ROLES.Count > 0)
                                {

                                    foreach (Models.Mod_Roles Roles in User.ROLES)
                                    {
                                        listItems += "<li> <input type='button' class='ButtonDark' value='X' onclick='DesasignarRol(\"" + Roles.ID + "\",\"" + User.ID + "\")' /> " + Roles.ROLE + " </li>";
                                    }
                                }

                                Response.Write(
                                    "<tr class='droppable TableRows' idUser='" + User.ID + "'>" +
                                        "<td>" + User.USERNAME + "</td>" +
                                        "<td>" +
                                            "<ul idUser='" + User.ID + "' style='list-style-type: none;'>" +
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