<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Pacientes.ascx.cs" Inherits="Pacientes.Pacientes" %>

<!-- CONTENT -->
<div>

    <!-- Buscador -->
    <div>

        <label style="display: inline-block;" class="LabelInput">
            <input placeholder="ej: Lapenna Luciano" style="color: rgba(255,255,255,0.8)" class="Input" type="text" />
            <span class="InputPlaceholderWrap">
                <span class="InputPlaceholder">NOMBRE</span>
            </span>
        </label>

        <input type="button" class="ButtonDark" value="BUSCAR" />
        <input type="button" value="AGREGAR" class="ButtonDark"/>
    </div>

    <!-- Tabla de resultados -->
    <div class="Table">
        <table>

            <tr class="TopRow">
                <th>APELLIDO</th>
                <th>NOMBRE</th>
                <th>TELÉFONO</th>
                <th>NRO. DOC.</th>
            </tr>
            <tr class="TableRows">
                <td>Lapenna</td>
                <td>Luciano</td>
                <td>52912920</td>
                <td>42673345</td>
                <td><input type="button" value="EDITAR" class="ButtonDark"/></td>
            </tr>
            <tr class="TableRows">
                <td>Suriano</td>
                <td>Ramiro</td>
                <td>14408732</td>
                <td>32874014</td>
                <td><input type="button" value="EDITAR" class="ButtonDark"/></td>
            </tr>
            <tr class="TableRows">
                <td>Chaves</td>
                <td>David</td>
                <td>34084119</td>
                <td>19410834</td>
                <td><input type="button" value="EDITAR" class="ButtonDark"/></td>
            </tr>

        </table>
    </div>
</div>

<!-- POP UPS -->
<div>

</div>

<!-- HIDDENS -->
<div>

</div>
