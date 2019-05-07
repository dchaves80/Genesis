<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Pacientes.ascx.cs" Inherits="Pacientes.Pacientes" %>

<!-- PACIENTES -->
<h1>PACIENTES</h1>

<!-- CONTENT -->
<div>

    <!-- Create and search -->
    <div>

        <label style='display: inline-block; margin-right: 20px; margin-top: 20px;' class='InputTextDarkLabel'>
            <input style='color: rgba(255,255,255,0.8)' placeholder='ej: Enfermerx' class='InputTextDark' type='text'/>
            <span class="InputTextDarkPlaceholderWrap">
                <span class="InputTextDarkPlaceholder"><i class="fas fa-search"></i></span>
            </span>
        </label>

        <i id="test" class="fas fa-plus" style="margin-right: 50px;" onclick="Test(this)"></i>
         
    </div>


    <!-- Text Inputs -->
    <div>

        <!-- Personal Info -->
        <div>
            <h2>Información Personal</h2>

            <!-- Name and surname -->

            <label style='display: inline-block; margin-right: 20px;' class='InputTextDarkLabel'>
                <input style='color: rgba(255,255,255,0.8)' placeholder='ej: Juan' class='InputTextDark' type='text' />
                <span class="InputTextDarkPlaceholderWrap">
                    <span class="InputTextDarkPlaceholder">NOMBRE </span>
                </span>
            </label>

            <label style='display: inline-block; margin-right: 20px;' class='InputTextDarkLabel'>
                <input style='color: rgba(255,255,255,0.8)' placeholder='ej: Pérez' class='InputTextDark' type='text' />
                <span class="InputTextDarkPlaceholderWrap">
                    <span class="InputTextDarkPlaceholder">APELLIDO </span>
                </span>
            </label>


            <!-- Identity card -->

            <label style='display: inline-block; margin-right: 20px;' class='InputTextDarkLabel'>
                <input style='color: rgba(255,255,255,0.8)' placeholder='ej: 25978269' class='InputTextDark' type='text' />
                <span class="InputTextDarkPlaceholderWrap">
                    <span class="InputTextDarkPlaceholder">DOCUMENTO </span>
                </span>
            </label>


            <!-- Birth date -->
            <label style="display: inline-block;">
                <span style="display: block;">FECHA DE NACIMIENTO</span>
                <input style="margin-left: 10px;" type="date" class="ButtonDark" />
            </label>

            <br />
            

            <!-- Gender -->                         
                <label style='display: inline-block; margin-right: 20px;' class='InputTextDarkLabel'>
                    <input style='color: rgba(255,255,255,0.8)' placeholder='ej: Masculino' class='InputTextDark' type='text' />
                    <span class="InputTextDarkPlaceholderWrap">
                        <span class="InputTextDarkPlaceholder">GÉNERO </span>
                    </span>
                </label>     


            <!-- Sex -->
            <div style="display: inline-block; margin-left: 20px; margin-top: 20px;">

                <span style="display: block;">SEXO</span>

                <label class="RadioDark">
                    <input type="radio" name="sex" />
                    <span>Masculino</span>
                </label>

                <br />

                <label class="RadioDark">
                    <input type="radio" name="sex" />
                    <span>Femenino</span>
                </label>

            </div>                   

        </div>

        <!-- Contact Info -->
        <div style="margin-top: 100px;">
            <h2>Información de contacto</h2>
            
            <!-- Residence -->
            <label style='display: inline-block; margin-right: 20px;' class='InputTextDarkLabel'>
                <input style='color: rgba(255,255,255,0.8)' placeholder='ej: Villa Nueva 269' class='InputTextDark' type='text' />
                <span class="InputTextDarkPlaceholderWrap">
                    <span class="InputTextDarkPlaceholder">DOMICILIO </span>
                </span>
            </label>

            <label style='display: inline-block; margin-right: 20px;' class='InputTextDarkLabel'>
                <input style='color: rgba(255,255,255,0.8)' placeholder='ej: Arroyo Cabral' class='InputTextDark' type='text' />
                <span class="InputTextDarkPlaceholderWrap">
                    <span class="InputTextDarkPlaceholder">LOCALIDAD </span>
                </span>
            </label>

            <label style='display: inline-block; margin-right: 20px;' class='InputTextDarkLabel'>
                <input style='color: rgba(255,255,255,0.8)' placeholder='ej: 49782435' class='InputTextDark' type='text' />
                <span class="InputTextDarkPlaceholderWrap">
                    <span class="InputTextDarkPlaceholder">TELÉFONO </span>
                </span>
            </label>

        </div>

        <!-- Health Insurance -->
        <div style="margin-top: 100px;">
            <h2>OBRA SOCIAL</h2>
            <!-- Confirms health insurance -->
            <div style="display: inline-block; margin-top: 25px;">
                <span>¿Posee obra social?</span>
                <input id="chboxHealthInsurance" type="checkbox" checked />
            </div>

            <div style="display: inline-block;">
                <label style='display: inline-block; margin-right: 20px;' class='InputTextDarkLabel'>
                    <input style='color: rgba(255,255,255,0.8)' placeholder='ej: 478915-0' class='InputTextDark' type='text' />
                    <span class="InputTextDarkPlaceholderWrap">
                        <span class="InputTextDarkPlaceholder">NRO AFILIADO </span>
                    </span>
                </label>
            </div>
        </div>


    </div>
    
    
</div>

<!-- POP UPS -->
<div>

</div>

<!-- HIDDENS -->
<div>

</div>
