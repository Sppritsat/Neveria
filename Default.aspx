<%@ Page Title="Inicio" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Crud_WebForms._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Hero Section -->
    <div class="jumbotron text-center p-5 mb-4" style="background: linear-gradient(135deg, #E91E63 0%, #FF69B4 100%); border-radius: 15px; color: white;">
        <h1 class="display-4 fw-bold">🍦 Bienvenido a Nevería La Paleta</h1>
        <p class="lead">Sistema de Gestión de Inventario</p>
        <hr class="my-4" style="border-color: rgba(255,255,255,0.3);">
        <p>Controla y administra el inventario de tu nevería de manera eficiente</p>
        <a class="btn btn-light btn-lg" href="Producto.aspx" role="button">🍨 Ir al Inventario</a>
    </div>

    <!-- Statistics Cards -->
    <div class="row mb-4">
        <div class="col-md-3 mb-3">
            <div class="card text-center shadow-sm h-100" style="border-left: 5px solid #E91E63;">
                <div class="card-body">
                    <div style="font-size: 3rem; color: #E91E63;">📦</div>
                    <h3 class="card-title" style="color: #E91E63;">23+</h3>
                    <p class="card-text text-muted">Productos Activos</p>
                </div>
            </div>
        </div>

        <div class="col-md-3 mb-3">
            <div class="card text-center shadow-sm h-100" style="border-left: 5px solid #FF69B4;">
                <div class="card-body">
                    <div style="font-size: 3rem; color: #FF69B4;">🍦</div>
                    <h3 class="card-title" style="color: #FF69B4;">6</h3>
                    <p class="card-text text-muted">Categorías</p>
                </div>
            </div>
        </div>

        <div class="col-md-3 mb-3">
            <div class="card text-center shadow-sm h-100" style="border-left: 5px solid #28a745;">
                <div class="card-body">
                    <div style="font-size: 3rem; color: #28a745;">✅</div>
                    <h3 class="card-title" style="color: #28a745;">CRUD</h3>
                    <p class="card-text text-muted">Completo</p>
                </div>
            </div>
        </div>

        <div class="col-md-3 mb-3">
            <div class="card text-center shadow-sm h-100" style="border-left: 5px solid #ffc107;">
                <div class="card-body">
                    <div style="font-size: 3rem; color: #ffc107;">⚡</div>
                    <h3 class="card-title" style="color: #ffc107;">MySQL</h3>
                    <p class="card-text text-muted">Base de Datos</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Features Section -->
    <div class="row mb-4">
        <div class="col-md-12 mb-3">
            <h2 class="text-center" style="color: #E91E63;">✨ Características del Sistema</h2>
            <p class="text-center text-muted">Todo lo que necesitas para gestionar tu inventario</p>
        </div>

        <div class="col-md-4 mb-3">
            <div class="card shadow-sm h-100">
                <div class="card-body">
                    <div class="text-center mb-3" style="font-size: 3rem;">➕</div>
                    <h5 class="card-title text-center" style="color: #E91E63;">Alta de Productos</h5>
                    <p class="card-text text-center">
                        Registra nuevos productos con código, nombre, descripción, precio y existencias.
                        Validaciones automáticas para garantizar datos correctos.
                    </p>
                </div>
            </div>
        </div>

        <div class="col-md-4 mb-3">
            <div class="card shadow-sm h-100">
                <div class="card-body">
                    <div class="text-center mb-3" style="font-size: 3rem;">✏️</div>
                    <h5 class="card-title text-center" style="color: #FF69B4;">Actualización</h5>
                    <p class="card-text text-center">
                        Modifica la información de productos existentes. 
                        Selecciona, edita y guarda cambios de manera sencilla.
                    </p>
                </div>
            </div>
        </div>

        <div class="col-md-4 mb-3">
            <div class="card shadow-sm h-100">
                <div class="card-body">
                    <div class="text-center mb-3" style="font-size: 3rem;">❌</div>
                    <h5 class="card-title text-center" style="color: #dc3545;">Baja de Productos</h5>
                    <p class="card-text text-center">
                        Elimina productos obsoletos o descontinuados.
                        Confirmación de seguridad antes de eliminar.
                    </p>
                </div>
            </div>
        </div>

        <div class="col-md-4 mb-3">
            <div class="card shadow-sm h-100">
                <div class="card-body">
                    <div class="text-center mb-3" style="font-size: 3rem;">📊</div>
                    <h5 class="card-title text-center" style="color: #28a745;">Consultas</h5>
                    <p class="card-text text-center">
                        Visualiza todo tu inventario en formato de tabla.
                        Datos ordenados y formato profesional.
                    </p>
                </div>
            </div>
        </div>

        <div class="col-md-4 mb-3">
            <div class="card shadow-sm h-100">
                <div class="card-body">
                    <div class="text-center mb-3" style="font-size: 3rem;">⚠️</div>
                    <h5 class="card-title text-center" style="color: #ffc107;">Alertas</h5>
                    <p class="card-text text-center">
                        Indicadores visuales de inventario bajo, medio y normal.
                        Identifica rápidamente productos a reabastecer.
                    </p>
                </div>
            </div>
        </div>

        <div class="col-md-4 mb-3">
            <div class="card shadow-sm h-100">
                <div class="card-body">
                    <div class="text-center mb-3" style="font-size: 3rem;">🔒</div>
                    <h5 class="card-title text-center" style="color: #17a2b8;">Seguridad</h5>
                    <p class="card-text text-center">
                        Validaciones de datos, manejo de errores y consultas parametrizadas
                        para proteger tu información.
                    </p>
                </div>
            </div>
        </div>
    </div>

    <!-- Quick Actions -->
    <div class="card shadow-sm mb-4">
        <div class="card-header text-white" style="background: linear-gradient(135deg, #E91E63 0%, #FF69B4 100%);">
            <h4 class="mb-0">🚀 Accesos Rápidos</h4>
        </div>
        <div class="card-body">
            <div class="row text-center">
                <div class="col-md-4 mb-3">
                    <a href="Producto.aspx" class="text-decoration-none">
                        <div class="p-4 bg-light rounded" style="transition: all 0.3s;">
                            <div style="font-size: 3rem;">🍨</div>
                            <h5 class="mt-2" style="color: #E91E63;">Gestionar Inventario</h5>
                            <p class="text-muted">Administra tus productos</p>
                        </div>
                    </a>
                </div>
                <div class="col-md-4 mb-3">
                    <a href="About.aspx" class="text-decoration-none">
                        <div class="p-4 bg-light rounded" style="transition: all 0.3s;">
                            <div style="font-size: 3rem;">ℹ️</div>
                            <h5 class="mt-2" style="color: #E91E63;">Acerca de</h5>
                            <p class="text-muted">Conoce más sobre nosotros</p>
                        </div>
                    </a>
                </div>
                <div class="col-md-4 mb-3">
                    <a href="Contact.aspx" class="text-decoration-none">
                        <div class="p-4 bg-light rounded" style="transition: all 0.3s;">
                            <div style="font-size: 3rem;">📞</div>
                            <h5 class="mt-2" style="color: #E91E63;">Contacto</h5>
                            <p class="text-muted">Ponte en contacto</p>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </div>

    <!-- Technology Stack -->
    <div class="row mb-4">
        <div class="col-md-12">
            <div class="card shadow-sm">
                <div class="card-body">
                    <h4 class="text-center mb-4" style="color: #E91E63;">💻 Tecnologías Utilizadas</h4>
                    <div class="row text-center">
                        <div class="col-md-3 mb-3">
                            <div class="p-3">
                                <div style="font-size: 2.5rem;">🌐</div>
                                <h6 class="mt-2">ASP.NET</h6>
                                <small class="text-muted">WebForms</small>
                            </div>
                        </div>
                        <div class="col-md-3 mb-3">
                            <div class="p-3">
                                <div style="font-size: 2.5rem;">💾</div>
                                <h6 class="mt-2">MySQL</h6>
                                <small class="text-muted">Base de Datos</small>
                            </div>
                        </div>
                        <div class="col-md-3 mb-3">
                            <div class="p-3">
                                <div style="font-size: 2.5rem;">🎨</div>
                                <h6 class="mt-2">Bootstrap 5</h6>
                                <small class="text-muted">Frontend</small>
                            </div>
                        </div>
                        <div class="col-md-3 mb-3">
                            <div class="p-3">
                                <div style="font-size: 2.5rem;">⚙️</div>
                                <h6 class="mt-2">C#</h6>
                                <small class="text-muted">Backend</small>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Call to Action -->
    <div class="text-center p-5 mb-4" style="background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%); border-radius: 15px;">
        <h3 style="color: #E91E63;">¿Listo para gestionar tu inventario?</h3>
        <p class="lead text-muted">Comienza a administrar tus productos de manera eficiente</p>
        <a href="Producto.aspx" class="btn btn-primary btn-lg" style="background: linear-gradient(135deg, #E91E63 0%, #FF69B4 100%); border: none;">
            🍦 Comenzar Ahora
        </a>
    </div>

    <!-- Project Info -->
    <div class="alert alert-info" role="alert">
        <h5 class="alert-heading">📚 Proyecto Académico</h5>
        <p>
            Este sistema fue desarrollado como proyecto integrador para la materia de <strong>Desarrollo Web</strong>,
            implementando operaciones CRUD completas (Crear, Leer, Actualizar, Eliminar) con ASP.NET WebForms y MySQL.
        </p>
        <hr>
        <p class="mb-0">
            <strong>Institución:</strong> [Tu Universidad] | 
            <strong>Carrera:</strong> Lic. en Informática y Tecnologías Computacionales | 
            <strong>Semestre:</strong> 5to
        </p>
    </div>
</asp:Content>