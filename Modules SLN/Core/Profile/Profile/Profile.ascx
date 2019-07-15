<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Profile.ascx.cs" Inherits="Profile.Profile" %>
<%@ Import Namespace="Models" %>

<%Models.Mod_Users USR =  (Session[Models.ConstantLibrary.Session_Library.USER] as Models.Mod_Users)%>
<%List<Models.Mod_Roles> Roles = USR.GetRoles(); %>

<h1>PERFIL DE USUARIO:<%=USR.USERNAME %></h1>
<h3>Roles:
    <%
        if (Roles != null)
        {
            foreach (Mod_Roles r in Roles)
            {

                Response.Write(r.ROLE);
                if (r != Roles[Roles.Count - 1])
                {
                    Response.Write(", ");
                }
            }
        }
        %>
</h3>



<!-- Modulo de cambios de contraseñas -->
<h2>Cambio de contraseña</h2>
<div>
    <div>
        <label class="InputTextDarkLabel" style="display: inline-block;">
            <input id="psw1" type="text" class="InputTextDark ExcludeChar" placeholder="ej: *******" />
            <span class="InputTextDarkPlaceholderWrap"><span class="InputTextDarkPlaceholder">Contraseña</span></span>
        </label>
    </div>
    <div>
        <label class="InputTextDarkLabel" style="display: inline-block;">
            <input id="psw2" type="text" class="InputTextDark ExcludeChar" placeholder="ej: *******" />
            <span class="InputTextDarkPlaceholderWrap"><span class="InputTextDarkPlaceholder">Repetir contraseña</span></span>
        </label>
    </div>
    <br />

    <input class="ButtonDark" onclick="" value="CAMBIAR CONTRASEÑA" type="button" style="margin-top: 20px; margin-left: 150px;" />
</div>

