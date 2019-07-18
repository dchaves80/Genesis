<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="HistoriaClinica.ascx.cs" Inherits="HistoriaClinica.HistoriaClinica" %>

<!-- MEDICAL RECORD -->
<h1>Historia Clínica</h1>

<!-- ANTECEDENTES ¿? -->
        <div class="Antecedentes">

            <!-- Allergic -->
            <div>
                <input type="button" value="ANTECEDENTES" style="cursor: default;" onclick="OpenSideMenu(this)" class="ButtonDark" />                
            </div>

            <!-- Pathologic -->
            <div>
                <input type="button" value="Patológicos" onclick="OpenSideMenu(this)" class="ButtonDark" />
                <div style="display: none;">
                    <table class="TableDark">
                            <tr>
                                <th>Registro</th>
                                <th>Fecha</th>
                            </tr>                   
                    </table>
                </div>
            </div>

            <!-- Surgies -->
            <div>
                <input type="button" value="Quirúrgicos" onclick="OpenSideMenu(this)" class="ButtonDark" />
                <div style="display: none;">
                    <table class="TableDark">
                            <tr>
                                <th>Registro</th>
                                <th>Fecha</th>
                            </tr>                   
                    </table>
                </div>
            </div>

            <!-- Toxic habits -->
            <div>
                <input type="button" value="Hábitos tóxicos" onclick="OpenSideMenu(this)" class="ButtonDark" />
                <div style="display: none;">
                    <table class="TableDark">
                            <tr>
                                <th>Registro</th>
                                <th>Fecha</th>
                            </tr>                   
                    </table>
                </div>
            </div>

            <!-- Medication -->
            <div>
                <input type="button" value="Medicación" onclick="OpenSideMenu(this)" class="ButtonDark" />
                <div style="display: none;">
                    <table class="TableDark">
                            <tr>
                                <th>Registro</th>
                                <th>Fecha</th>
                            </tr>                   
                    </table>
                </div>
            </div>

            <!-- Anthropometry -->
            <div>
                <input type="button" value="Antropometría" onclick="OpenSideMenu(this)" class="ButtonDark" />
                <div style="display: none;">
                    <table class="TableDark">
                            <tr>
                                <th>Registro</th>
                                <th>Fecha</th>
                            </tr>                   
                    </table>
                </div>
            </div>


        </div>

<!-- CONTENT -->
<div>
    
    <div style="margin-top: 30px">

        <!-- Basic INFO -->
        <div style="display: inline-block;">
            <table class="TableDark">
                <tr>
                    <th>Nombre</th>
                    <th>Apellido</th>
                    <th>Obra social</th>
                    <th>Fecha de Nacimiento</th>
                </tr>
                <tr>
                    <td>Luciano</td>
                    <td>Lapenna</td>
                    <td>Vita's</td>
                    <td>21/10/2000 (18 años)</td>
                </tr>
            </table>
        </div>

        

    </div>

    <!-- Medical Record -->
    <div style="margin-top: 50px; width: 50%;">

        <div style="overflow-y: scroll; height: 370px;">
            <!-- 1st medical record-->
            <div class="Record">
                <span><i style="margin-right: 10px;" class="fas fa-plus"></i>Corregimiento de córnea</span>
            </div>

            <!-- 2nd medical record-->
            <div class="Record">
                <span><i class="fas fa-plus"></i>Dolores abdominales</span>
            </div>

            <!-- 2nd medical record-->
            <div class="Record">
                <span><i class="fas fa-plus"></i>Dolores abdominales</span>
            </div>

            <!-- 2nd medical record-->
            <div class="Record">
                <span><i class="fas fa-plus"></i>Dolores abdominales</span>
            </div>

            <!-- 2nd medical record-->
            <div class="Record">
                <span><i class="fas fa-plus"></i>Dolores abdominales</span>
            </div>

            <!-- 2nd medical record-->
            <div class="Record">
                <span><i class="fas fa-plus"></i>Dolores abdominales</span>
            </div>

            <!-- 2nd medical record-->
            <div class="Record">
                <span><i class="fas fa-plus"></i>Dolores abdominales</span>
            </div>


        </div>
    </div>
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

