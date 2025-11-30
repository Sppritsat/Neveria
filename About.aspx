<%@ Page Title="Acerca de" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="Crud_WebForms.About" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <!-- Header Section -->
        <div class="text-center mb-5">
            <h1 id="title" style="color: #667eea; font-weight: bold;">🍦 Acerca de Nevería La Paleta</h1>
            <p class="lead" style="color: #666;">Dulzura y frescura desde 1995</p>
        </div>

        <!-- Mission & Vision Cards -->
        <div class="row mb-4">
            <div class="col-md-6 mb-3">
                <div class="card shadow-sm h-100">
                    <div class="card-header text-white" style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);">
                        <h4 class="mb-0">🎯 Nuestra Misión</h4>
                    </div>
                    <div class="card-body">
                        <p class="card-text">
                            Ofrecer productos de la más alta calidad elaborados con ingredientes naturales, 
                            brindando momentos de felicidad y frescura a nuestros clientes. Nos comprometemos 
                            a mantener los sabores tradicionales mexicanos mientras innovamos constantemente.
                        </p>
                    </div>
                </div>
            </div>

            <div class="col-md-6 mb-3">
                <div class="card shadow-sm h-100">
                    <div class="card-header text-white" style="background: linear-gradient(135deg, #764ba2 0%, #667eea 100%);">
                        <h4 class="mb-0">👁️ Nuestra Visión</h4>
                    </div>
                    <div class="card-body">
                        <p class="card-text">
                            Ser la nevería preferida de la región, reconocida por nuestra excelencia en 
                            servicio, calidad de productos y compromiso con la comunidad. Aspiramos a 
                            expandir nuestra presencia manteniendo siempre la calidez y tradición familiar.
                        </p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Story Section -->
        <div class="card shadow-sm mb-4">
            <div class="card-body">
                <h3 style="color: #667eea;">📖 Nuestra Historia</h3>
                <p>
                    <strong>Nevería La Paleta</strong> nació en 1995 como un pequeño negocio familiar en el corazón 
                    de Aguascalientes. Lo que comenzó como el sueño de Don José y Doña María se ha convertido en 
                    una tradición querida por generaciones.
                </p>
                <p>
                    Con recetas heredadas y perfeccionadas a lo largo de casi 30 años, nos especializamos en 
                    paletas artesanales, nieves de garrafa tradicionales y helados cremosos. Cada producto es 
                    elaborado con ingredientes naturales y el amor de quien disfruta su oficio.
                </p>
                <p>
                    Hoy en día, seguimos siendo un negocio 100% familiar, donde la calidad y el sabor auténtico 
                    son nuestra prioridad. Este sistema de inventario representa nuestro compromiso con la 
                    modernización sin perder nuestras raíces.
                </p>
            </div>
        </div>

        <!-- Features Section -->
        <div class="row mb-4">
            <div class="col-md-12">
                <h3 class="text-center mb-4" style="color: #667eea;">✨ Lo que nos hace especiales</h3>
            </div>
            
            <div class="col-md-3 col-sm-6 mb-3">
                <div class="card text-center h-100 shadow-sm">
                    <div class="card-body">
                        <div style="font-size: 3rem;">🍓</div>
                        <h5 class="card-title">Ingredientes Naturales</h5>
                        <p class="card-text">Frutas frescas y productos de la más alta calidad</p>
                    </div>
                </div>
            </div>

            <div class="col-md-3 col-sm-6 mb-3">
                <div class="card text-center h-100 shadow-sm">
                    <div class="card-body">
                        <div style="font-size: 3rem;">👨‍👩‍👧‍👦</div>
                        <h5 class="card-title">Negocio Familiar</h5>
                        <p class="card-text">Tradición y amor en cada producto</p>
                    </div>
                </div>
            </div>

            <div class="col-md-3 col-sm-6 mb-3">
                <div class="card text-center h-100 shadow-sm">
                    <div class="card-body">
                        <div style="font-size: 3rem;">🏆</div>
                        <h5 class="card-title">Calidad Garantizada</h5>
                        <p class="card-text">Más de 28 años de experiencia</p>
                    </div>
                </div>
            </div>

            <div class="col-md-3 col-sm-6 mb-3">
                <div class="card text-center h-100 shadow-sm">
                    <div class="card-body">
                        <div style="font-size: 3rem;">💚</div>
                        <h5 class="card-title">Recetas Tradicionales</h5>
                        <p class="card-text">Sabores auténticos mexicanos</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Products Section -->
        <div class="card shadow-sm mb-4">
            <div class="card-body">
                <h3 style="color: #667eea;">🍨 Nuestros Productos</h3>
                <div class="row">
                    <div class="col-md-4">
                        <h5><strong>Paletas</strong></h5>
                        <ul>
                            <li>Paletas de agua natural</li>
                            <li>Paletas de leche cremosas</li>
                            <li>Paletas con chile</li>
                            <li>Paletas enchiladas</li>
                        </ul>
                    </div>
                    <div class="col-md-4">
                        <h5><strong>Nieves y Helados</strong></h5>
                        <ul>
                            <li>Nieves de garrafa tradicionales</li>
                            <li>Helados cremosos</li>
                            <li>Nieves de yogurt</li>
                            <li>Helados premium</li>
                        </ul>
                    </div>
                    <div class="col-md-4">
                        <h5><strong>Otros Productos</strong></h5>
                        <ul>
                            <li>Raspados con jarabe natural</li>
                            <li>Malteadas y licuados</li>
                            <li>Aguas frescas</li>
                            <li>Conos y copas</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <!-- Technology Section -->
        <div class="card shadow-sm mb-4" style="background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);">
            <div class="card-body">
                <h3 style="color: #667eea;">💻 Sistema de Inventario</h3>
                <p>
                    Este sistema web fue desarrollado como parte de nuestro compromiso con la innovación 
                    y la eficiencia. Utilizando tecnologías modernas como <strong>ASP.NET WebForms</strong> 
                    y <strong>MySQL</strong>, podemos mantener un control preciso de nuestro inventario.
                </p>
                <p class="mb-0">
                    <strong>Características del sistema:</strong>
                </p>
                <ul>
                    <li>Gestión completa de productos (Alta, Baja, Actualización y Consulta)</li>
                    <li>Alertas automáticas de inventario bajo</li>
                    <li>Interfaz moderna y fácil de usar</li>
                    <li>Seguridad y validación de datos</li>
                    <li>Reportes en tiempo real</li>
                </ul>
                <p class="mb-0">
                    <strong>Proyecto desarrollado por:</strong> [Tu Nombre]<br>
                    <strong>Carrera:</strong> Licenciatura en Informática y Tecnologías Computacionales<br>
                    <strong>Institución:</strong> [Tu Universidad]<br>
                    <strong>Materia:</strong> Desarrollo Web - Parcial 3
                </p>
            </div>
        </div>

        <!-- Values Section -->
        <div class="card shadow-sm mb-4">
            <div class="card-body">
                <h3 style="color: #667eea;">💎 Nuestros Valores</h3>
                <div class="row">
                    <div class="col-md-6">
                        <ul>
                            <li><strong>Calidad:</strong> Productos elaborados con los mejores ingredientes</li>
                            <li><strong>Honestidad:</strong> Transparencia en nuestros procesos y precios</li>
                            <li><strong>Servicio:</strong> Atención cálida y personalizada</li>
                        </ul>
                    </div>
                    <div class="col-md-6">
                        <ul>
                            <li><strong>Tradición:</strong> Respeto por las recetas originales</li>
                            <li><strong>Innovación:</strong> Mejora continua y nuevos sabores</li>
                            <li><strong>Comunidad:</strong> Compromiso con nuestro entorno</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <!-- Contact CTA -->
        <div class="text-center p-4" style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); border-radius: 10px;">
            <h4 class="text-white mb-3">¿Quieres saber más?</h4>
            <p class="text-white mb-3">Visítanos o contáctanos para conocer nuestros productos y promociones</p>
            <a href="Contact.aspx" class="btn btn-light btn-lg">📞 Contáctanos</a>
        </div>
    </main>
</asp:Content>