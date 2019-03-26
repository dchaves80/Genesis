<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TextInputDark.ascx.cs" Inherits="Genesis.Pages.General.TextInputDark" %>

<!-- CONTENT -->
<label style='display: inline-block; margin-right: 20px; margin-top: 20px;' class='InputTextDarkLabel'>
    <input style='color: rgba(255,255,255,0.8)' placeholder="<% =Placeholder %>" id="<% =IdControl %>" class='InputTextDark' type='text' />
    <span class='InputTextDarkPlaceholderWrap'>
        <span class='InputTextDarkPlaceholder'><% =ControlName %></span>
    </span>
</label>
