<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Usuarios.ascx.cs" Inherits="Usuarios.Usuarios" %>

<!-- USUARIOS -->
<h1>USUARIOS</h1>

<!-- CONTENT -->
<div>
    <h2>Crear Usuario</h2>

    <!-- Stage 1 -->
    <div id="stage1">

        <!-- Input username -->
        <div>
            <label class="LabelInput" style="display: inline-block;">
                <input id="inputUsername" type="text" class="Input ExcludeChar" placeholder="ej: Luciano Lapenna" />
                <span class="InputPlaceholderWrap"><span class="InputPlaceholder">USERNAME</span></span>
            </label>
        </div>
        
        <br />

        <!-- Input Emails -->
        <div style="display: inline-block; margin-top: 20px;">

            <!-- Input Email -->
            <label class="LabelInput" style="display: inline-block;">
                <input id="inputEmail" type="text" class="Input ExcludeChar" placeholder="ej: xxx@yyy.com" />
                <span class="InputPlaceholderWrap"><span class="InputPlaceholder">E-MAIL</span></span>
            </label>


            <!-- Input confirmar email -->
            <label class="LabelInput" style="display: inline-block;">
                <input id="inputConfirmEmail" type="text" class="Input ExcludeChar" placeholder="ej: xxx@yyy.com" />
                <span class="InputPlaceholderWrap"><span class="InputPlaceholder">CONFIRMAR E-MAIL</span></span>
            </label>

        </div>

        <br />

        <input class="ButtonDark" onclick="ConfirmUserAndEmail()" value="SIGUIENTE" type="button" style="margin-top: 20px; margin-left: 150px;" />

    </div>



    <!-- Stage 2 -->
    <div id="stage2" style="display: none;">
        <!-- Input passwords -->
        <div style="display: inline-block;">

            <!-- Input Password -->
            <label class="LabelInput" style="display: inline-block;">
                <input id="inputPassword" type="password" class="Input ExcludeChar" placeholder="ej: ********" />
                <span class="InputPlaceholderWrap"><span class="InputPlaceholder">CONTRASEÑA</span></span>
            </label>

            <!-- Input confirmar email -->
            <label class="LabelInput" style="display: inline-block;">
                <input id="inputConfirmPassword" type="password" class="Input ExcludeChar" placeholder="ej: ********" />
                <span class="InputPlaceholderWrap"><span class="InputPlaceholder">CONFIRMAR CONTRASEÑA</span></span>
            </label>
        </div>

        <br />

        <div style="margin-left: 130px; margin-top: 20px; display: inline-block;">
            <input class="ButtonDark" onclick="Volver()" value="VOLVER" type="button" />
            <input class="ButtonDark" onclick="ConfirmPassword()" value="CREAR" type="button" />
        </div>

    </div>

</div>

<!-- POP UPS -->
<div>

</div>

<!-- HIDDENS -->
<div>

    <input type="hidden" id="emailHidden" />
    <input type="hidden" id="userHidden" />

</div>
