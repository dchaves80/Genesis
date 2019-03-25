<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Roles.ascx.cs" Inherits="Roles.Roles" %>

<!-- ROLES -->
<h1>ROLES</h1>

<!-- CONTENT -->
<div>

    
    <input type="button" onclick="AbrirCrearlRol(this)" class="ButtonDark" value="CREAR" id="crearRolButton" />
    <input type="button" onclick="AsignarRol(this)" class="ButtonDark" value="ASIGNAR" id="asignarRolButton"/>

    <!-- CREAR ROL -->
    <div style="display: none;" id="crearRolDiv">

        <label style='display: inline-block; margin-right: 20px; margin-top: 20px;' class='InputTextDarkLabel'>
            <input style='color: rgba(255,255,255,0.8)' placeholder='ej: Enfermerx' class='InputTextDark' type='text' id="nuevoRolText" />
            <span class='InputTextDarkPlaceholderWrap'><span class='InputTextDarkPlaceholder'>NUEVO ROL</span></span>
        </label>

        <input onclick="CrearRol()" type="button" class="ButtonDark" value="CREAR"/>
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
                                "<td>" +
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
                <th>USUARIOS</th>
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