<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Roles.ascx.cs" Inherits="Roles.Roles" %>

<!-- ROLES -->
<h1>ROLES</h1>

<!-- CONTENT -->
<div>

    <!-- CREAR ROL -->
    <input type="button" onclick="AbrirCrearlRol(this)" class="ButtonDark" value="CREAR" id="crearRolButton" />

    <div style="display: none;" id="crearRolDiv">

        <label style='display: inline-block; margin-right: 20px; margin-top: 20px;' class='LabelInput'>
            <input style='color: rgba(255,255,255,0.8)' placeholder='ej: Enfermerx' class='Input' type='text' id="nuevoRolText" />
            <span class='InputPlaceholderWrap'><span class='InputPlaceholder'>NUEVO ROL</span></span>
        </label>

        <input onclick="CrearRol()" type="button" class="ButtonDark" value="CREAR"/>
    </div>


    <div id='RolesTableDiv' class="Table">             
        <table id="RolesTable">
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
                            "<tr>" +
                                "<td class='draggable'>" + Role.ROLE + "</td>" +
                                "<td>" +
                                    "<input class='ButtonDark' onclick='EditarRol(this)' value='Editar' type='button'/>" +
                                    "<input class='ButtonDark' onclick='EliminarRol(\"" + Role.ID + "\",\"" + Role.ROLE + "\")' value='Eliminar' type='button'/>" +
                                    "<div style='position: relative; display: inline-block; opacity: 0;'>" +
                                        "<label style='display: inline-block; margin-right: 20px;' class='LabelInput'>" +
                                            "<input style='color: rgba(255,255,255,0.8)' placeholder='ej: Enfermerx' class='Input' type='text'/>" +
                                            "<span class='InputPlaceholderWrap'><span class='InputPlaceholder'>NUEVO ROL</span></span>" +
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
    

</div>

<!-- POP UPS -->
<div>

</div>

<!-- HIDDENS -->
<div>

    <!-- Usado para verificar-->
    <input type="hidden" id="Status" />

</div>