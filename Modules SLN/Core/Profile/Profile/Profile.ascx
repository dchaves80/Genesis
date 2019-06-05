<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Profile.ascx.cs" Inherits="Profile.Profile" %>
<span>Mi perfil</span>
<br />
<span>Usuario:</span><%=(Session[Models.ConstantLibrary.Session_Library.USER] as Models.Mod_Users).USERNAME %>
<br />
<span>Nueva Contraseña:</span> <input type="password" /> <br />
<span>Repetir Contraseña:</span> <input type="password" /> <br />
<input type="button" value="Cambiar Contraseña" /><br />

