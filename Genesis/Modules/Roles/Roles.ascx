<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Roles.ascx.cs" Inherits="Roles.Roles" %>

<!-- ROLES -->
<h1>ROLES</h1>

<!-- CONTENT -->
<div>     

    <!-- Modo crear -->
    <div>
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
                                "<tr style='cursor: pointer;' class='draggable TableRows' idRole=" + Role.ID + ">" +
                                    "<td>" + Role.ROLE + "</td>" +
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
                                        listItems += "<li> <input type='button' class='ButtonDark' value='X' onclick='DesasignarRol(\"" + Roles.ID + "\")' /> " + Roles.ROLE + " </li>";
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



                <%--<tr idUser="1" class="droppable TableRows">
                    <td>l_lapenna</td>
                    <td>
                        <ul>
                            <li><input type="button" class="ButtonDark" value="X" />Enfermerx </li>
                            <li><input type="button" class="ButtonDark" value="X" />SuperUser </li>
                        </ul>
                    </td>
                </tr>
                <tr idUSer="2" class="droppable TableRows">
                    <td>atomicperson</td>
                    <td>
                        <ul>
                            <li>SuperUser</li>
                        </ul>
                    </td>
                </tr>--%>
            </table>

        </div>
    </div>

    <!-- Modo editar-->
    <div style="display: none;">

        <!-- Rol, eliminar y editar-->
        <div>
            <h2 style="display: inline;">SuperUser</h2>

            <input type="button" class="ButtonDark" value="ELIMINAR" style="margin-left: 20px;"/>            

            <label style='display: inline-block; margin-right: 20px; margin-top: 20px;' class='InputTextDarkLabel'>
                <input style='color: rgba(255,255,255,0.8)' placeholder='ej: Enfermerx' class='InputTextDark' type='text' />
                <span class='InputTextDarkPlaceholderWrap'><span class='InputTextDarkPlaceholder'>NUEVO NOMBRE</span></span>
            </label>

            <input type="button" class="ButtonDark" value="GUARDAR"/>

            <br />

            <input type="button" class="ButtonDark" value="VER USUARIOS ASOCIADOS" style="margin-top: 50px;"/>

        </div>

        <!-- Usuarios asociados-->
        <div style="margin-top: 50px; ">
            <table class="Table">
                <tr class="TopRow">
                    <th>USUARIO</th>
                </tr>
                <tr class="TableRows">
                    <td><input type="button" class="ButtonDark" value="X" /> l_lapenna</td>
                    
                </tr>
                <tr class="TableRows">
                    <td><input type="button" class="ButtonDark" value="X" /> atomicperson</td>
                </tr>
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