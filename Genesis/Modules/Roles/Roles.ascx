<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Roles.ascx.cs" Inherits="Roles.Roles" %>

<!-- ROLES -->
<h1>ROLES</h1>

<!-- CONTENT -->
<div>

    
    <%--<input type="button" onclick="AbrirCrearlRol(this)" class="ButtonDark" value="CREAR" id="crearRolButton" />
    <input type="button" onclick="AbrirAsignarRol()" class="ButtonDark" value="ASIGNAR" id="asignarRolButton" />

    <!-- CREAR ROL -->
    <div style="display: none;" id="crearRolDiv">

        <label style='display: inline-block; margin-right: 20px; margin-top: 20px;' class='InputTextDarkLabel'>
            <input style='color: rgba(255,255,255,0.8)' placeholder='ej: Enfermerx' class='InputTextDark' type='text' id="nuevoRolText" />
            <span class='InputTextDarkPlaceholderWrap'><span class='InputTextDarkPlaceholder'>NUEVO ROL</span></span>
        </label>

        <input onclick="CrearRol()" type="button" class="ButtonDark" value="CREAR" />
    </div>

    <div style="margin-top: 20px;" id="AdminRolDiv">

        <div id='RolesTableDiv' style="display: inline-block;" class="Table">
            <table class="Table" id="RolesTable">
                <tr class="TopRow">
                    <th>ROL</th>
                </tr>
                <%
                    List<Models.Mod_Roles> LMR = Models.Mod_Roles.Get_Roles(null, "%");

                    if (LMR != null)
                    {
                        foreach (Models.Mod_Roles Role in LMR)
                        {
                            Response.Write(
                                "<tr class='TableRows'>" +
                                    "<td class='draggable'>" + Role.ROLE + "</td>" +
                                    "<td class='editDiv'>" +
                                        "<input class='ButtonDark' onclick='EditarRol(this)' value='Editar' type='button'/>" +
                                        "<input class='ButtonDark' onclick='EliminarRol(\"" + Role.ID + "\",\"" + Role.ROLE + "\")' value='Eliminar' type='button'/>" +
                                        "<div style='position: relative; display: none; opacity: 0;'>" +
                                            "<label style='display: inline-block; margin-right: 20px;' class='InputTextDarkLabel'>" +
                                                "<input style='color: rgba(255,255,255,0.8)' placeholder='ej: Enfermerx' class='InputTextDark' type='text'/>" +
                                                "<span class='InputTextDarkPlaceholderWrap'><span class='InputTextDarkPlaceholder'>NUEVO ROL</span></span>" +
                                            "</label>" +
                                            "<input style='margin-right: 10px;' onclick='ConfirmarRolEdit(this,\"" + Role.ID + "\")' class='ButtonDark' value='✓' type='button'/>" +
                                            "<input style='margin-right: 10px;' onclick='CancelEditing(this)' type='button' class='ButtonDark' value='✕'/>" +
                                        "</div>" +
                                    "</td>" +
                                "</tr>");
                        }
                    }
                    else
                        Response.Write("<tr><td>Todavía no hay ningún rol creado.<td></tr>");

                %>
            </table>
        </div>

        <!-- Tabla usuarios -->
        <div style="display: none; opacity: 0; position: absolute;" id="UsuariosTableDiv">
            <table class="Table" id="usuariosTable">
                <tr class="TopRow">
                    <th>USUARIOS
                        <input type="button" class="ButtonDark" id="ocultarAsignarRol" value="OCULTAR" onclick="OcultarAsignarRol()" /></th>
                </tr>
                <tr class="TableRows">
                    <td>l_lapenna</td>
                </tr>
                <tr class="TableRows">
                    <td>atomicperson</td>
                </tr>
                <tr class="TableRows">
                    <td>Edering</td>
                </tr>

            </table>
        </div>
    </div>--%>

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
                                "<tr class='draggable TableRows' idRole=" + Role.ID + ">" +
                                    "<td>" + Role.ROLE + "</td>" +
                                "</tr>");
                        }
                    }
                    else
                        Response.Write("<tr><td>Todavía no hay ningún rol creado.</td></tr>");
                    %>
            </table>



            <!-- Tabla usuarios -->
            <table class="Table" style="display: inline; margin-left: 50px;">
                <tr class="TopRow">
                    <td>USUARIO</td>
                    <td>ROL ASIGNADO</td>
                </tr>
                <tr class="droppable TableRows">
                    <td>l_lapenna</td>
                    <td>
                        <ul>
                            <li><input type="button" class="ButtonDark" value="X" />Enfermerx </li>
                            <li><input type="button" class="ButtonDark" value="X" />SuperUser </li>
                        </ul>
                    </td>
                </tr>
                <tr class="droppable TableRows">
                    <td>atomicperson</td>
                    <td>
                        <ul>
                            <li>SuperUser</li>
                        </ul>
                    </td>
                </tr>
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