<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Profile.ascx.cs" Inherits="Profile.Profile" %>

<% //IMPORT @ Import Namespace="Models" %>

<%
    // Load User
    Models.Mod_Users USER = (Session[Models.ConstantLibrary.Session_Library.USER] as Models.Mod_Users);
    List<Models.Mod_Roles> Roles = USER.GetRoles();

%>

<!-- PROFILE -->
<h1>PERFIL</h1>

<!-- CONTENT -->

<div style="margin-top: 50px;" class="FlexContainer">

    <!-- Profile picture -->
    <div style="flex: 10%;">
        <img style="float: left; height: 250px;" class="ProfilePic" src="../../Assets/Images/Images/photo_2018-09-28_20-11-18.jpg">

        <div style="display: inline-block;">

            <h3>Cambiar foto de perfil</h3>
            <input type="file" value="Hola">
        </div>
    </div>

    <!-- Basic info -->
    <div style="flex: 100%;">

        <!-- Info display -->
        <div id="infoDisplay">
            <h3>Información básica</h3>

            <table class="TableDark">
                <tr>
                    <th>Nombre de Usuario</th>
                    <th>Nombre</th>
                    <th>Apellido</th>
                    <th>Email</th>
                </tr>
                <tr>
                    <td>losha</td>
                    <td>Luciano</td>
                    <td>Lapenna</td>
                    <td>lucianoglapenna@gmail.com</td>
                </tr>
            </table>

            <!-- Buttons -->
            <div style="margin-top: 100px">

                <input type="button" class="ButtonDark" value="Cambiar información básica" onclick="ChangeBasicInfo()" />
                <input type="button" class="ButtonDark" value="Cambiar contraseña" onclick="ChangePw()"/>

            </div>


        </div>

        <!-- Edit info -->
        <div style="margin-left: 50px; display:none;" id="editDiv">
            <!-- Change password info-->
            <div style="display: none;" id="changePw">

                <h3>Cambiar contraseña</h3>

                <label class="InputTextDarkLabel" style="display: inline-block; margin-top: 10px;">
                    <input type="text" class="InputTextDark ExcludeChar" placeholder="ej: Luciano Lapenna">
                    <span class="InputTextDarkPlaceholderWrap"><span class="InputTextDarkPlaceholder">Antigua contraseña</span></span>
                </label>

                <br />

                <label class="InputTextDarkLabel" style="display: inline-block; margin-top: 10px;">
                    <input type="text" class="InputTextDark ExcludeChar" placeholder="ej: Luciano Lapenna">
                    <span class="InputTextDarkPlaceholderWrap"><span class="InputTextDarkPlaceholder">Nueva contraseña</span></span>
                </label>

                <br />

                <label class="InputTextDarkLabel" style="display: inline-block; margin-top: 10px;">
                    <input type="text" class="InputTextDark ExcludeChar" placeholder="ej: Luciano Lapenna">
                    <span class="InputTextDarkPlaceholderWrap"><span class="InputTextDarkPlaceholder">Repetir nueva contraseña</span></span>
                </label>

                <br />

                <div style="margin-top: 30px;">
                    <input type="button" value="Volver" class="ButtonDark" onclick="BackToMain(this)"/>
                    <input type="button" value="Confirmar" class="ButtonDark" />
                </div>
                

            </div>

            <!-- Change basic info -->
            <div style="display: none;" id="changeBInfo">

                <div style="margin-top: 30px;">
                    <input type="button" value="Volver" class="ButtonDark" onclick="BackToMain(this)"/>
                    <input type="button" value="Confirmar" class="ButtonDark" />
                </div>

            </div>

        </div>
    </div>
</div>



<%--<div style="margin-top: 50px;">

    <div class="FlexContainer">

        <!-- Show info -->
        <div>

            <!-- Profile pic-->
            <div style="flex: 10%">
                
            </div>

            <!-- Basic info-->
            <div style="flex: 100%">

                

                

                <div>
                    <!-- Edit info -->
                    <div style="display: none;">

                        

                        <!-- Change basic info -->
                        <div style="display: none;">
                        </div>


                    </div>
                </div>

            </div>

        </div>
    </div>
</div>--%>

<!-- POP UPS -->
<div>
</div>

<!-- HIDDENS -->
<div>
</div>



<%--<!-- <h1>PERFIL DE USUARIO:<%=USER.USERNAME %></h1> -->
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
</div>--%>


