<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DynamicFields.ascx.cs" Inherits="DynamicField.DynamicFields" %>
<%@ Import Namespace="Models" %>

<div id="prototype" style="display:none">
    <label style='display: inline-block; margin-right: 20px; margin-top: 20px;' class='InputTextDarkLabel'>
    <input style='color: rgba(255,255,255,0.8)' placeholder='' class='InputTextDark FieldInput' type='text' data-FieldId="[df]" value="" />
    <span class='InputTextDarkPlaceholderWrap'><span class='InputTextDarkPlaceholder'>Campo:</span></span>
    </label>
    <input type='button' id="DeleteButton" class='ButtonDark' value='X'/>
</div>

<div id="DynamicFieldContainer">
<%
    List<Mod_DynamicField> l = Mod_DynamicField.Get_All();
    if (l != null)
    {
        foreach (Mod_DynamicField df in l)
        {
            Response.Write("<div id='Container" + df.ID.ToString() + "'>");
            Response.Write("<label style='display: inline-block; margin-right: 20px; margin-top: 20px;' class='InputTextDarkLabel'>");
            Response.Write("<input style='color: rgba(255,255,255,0.8)' placeholder='' class='InputTextDark FieldInput' type='text' data-FieldId='" + df.ID + "' value='" + df.NAME + "'>");
            Response.Write("<span class='InputTextDarkPlaceholderWrap'><span class='InputTextDarkPlaceholder'>Campo:</span></span>");
            Response.Write("</label>");
            Response.Write("<input type='button' class='ButtonDark' onclick='DeleteField(" + df.ID.ToString() + ",this)'  value='X'/>");
            Response.Write("</div>");
        }

       

    }
    else
    {
        Response.Write("<div>No hay campos dinamicos definidos en el servidor</div>");
    }
%>

    
</div>
<input type="button" class="ButtonDark" value="New field" onclick="AddField()"/>
