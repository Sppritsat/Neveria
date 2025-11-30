<%-- 
    Archivo: Producto.aspx
    Propósito: Página principal para gestión de inventario (CRUD completo)
    Autor: [Tu Nombre]
    Fecha: [Fecha]
    Descripción: Interfaz de usuario para agregar, actualizar, eliminar y consultar productos
    Vinculado a: Producto.aspx.cs (Code-behind)
--%>

<%-- Directiva de página: configura propiedades de la página ASP.NET --%>
<%@ Page Title="Inventario" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Producto.aspx.cs" Inherits="Crud_WebForms.tiendita_jeod" %>

<%-- ContentPlaceHolder: área donde se inserta el contenido en el Master Page --%>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <%-- SECCIÓN 1: FORMULARIO DE ENTRADA --%>
    <%-- Card principal que contiene el formulario CRUD --%>
    <div class="card shadow-sm">
        <%-- Header del formulario con gradiente rosa mexicano --%>
        <div class="card-header" style="background: linear-gradient(135deg, #E91E63 0%, #FF69B4 100%); color: white;">
            <h2 style="margin: 0;">🍨 Inventario de Nevería</h2>
        </div>
        
        <div class="card-body">
            <%-- Grid de Bootstrap: 2 columnas en pantallas medianas y grandes --%>
            <div class="row">
                
                <%-- COLUMNA 1: Información básica del producto --%>
                <div class="col-md-6">
                    
                    <%-- Campo: Código del producto --%>
                    <div class="mb-3">
                        <%-- Label con formato personalizado --%>
                        <asp:Label ID="lblCodigo" runat="server" CssClass="form-label" ForeColor="#E91E63" Font-Bold="true">
                            📋 Código del Producto
                        </asp:Label>
                        <%-- TextBox: input de texto estándar --%>
                        <%-- placeholder: texto de ayuda que desaparece al escribir --%>
                        <asp:TextBox ID="txtCodigo" runat="server" CssClass="form-control" placeholder="Ej: PAL001, NIEV002"></asp:TextBox>
                    </div>
                    
                    <%-- Campo: Nombre del producto --%>
                    <div class="mb-3">
                        <asp:Label ID="lblProducto" runat="server" CssClass="form-label" ForeColor="#E91E63" Font-Bold="true">
                            🍦 Nombre del Producto
                        </asp:Label>
                        <asp:TextBox ID="txtProducto" runat="server" CssClass="form-control" placeholder="Ej: Paleta de Fresa, Nieve de Limón"></asp:TextBox>
                    </div>

                    <%-- Campo: Descripción (multilinea, opcional) --%>
                    <div class="mb-3">
                        <asp:Label ID="lblDescripcion" runat="server" CssClass="form-label" ForeColor="#E91E63" Font-Bold="true">
                            📝 Descripción
                        </asp:Label>
                        <%-- TextMode="MultiLine": permite múltiples líneas de texto --%>
                        <%-- Rows="2": altura inicial del textarea --%>
                        <asp:TextBox ID="txtDescripcion" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="2" placeholder="Ej: Paleta de agua natural sabor fresa"></asp:TextBox>
                    </div>
                </div>

                <%-- COLUMNA 2: Información de precio e inventario --%>
                <div class="col-md-6">
                    
                    <%-- Campo: Precio (tipo número con decimales) --%>
                    <div class="mb-3">
                        <asp:Label ID="lblPrecio" runat="server" CssClass="form-label" ForeColor="#E91E63" Font-Bold="true">
                            💰 Precio (MXN)
                        </asp:Label>
                        <%-- TextMode="Number": valida que sea número --%>
                        <%-- step="0.01": permite decimales de 2 dígitos --%>
                        <asp:TextBox ID="txtPrecio" runat="server" CssClass="form-control" TextMode="Number" step="0.01" placeholder="Ej: 15.00"></asp:TextBox>
                    </div>

                    <%-- Campo: Existencias (tipo número entero) --%>
                    <div class="mb-3">
                        <asp:Label ID="lblExistencias" runat="server" CssClass="form-label" ForeColor="#E91E63" Font-Bold="true">
                            📦 Existencias (Unidades)
                        </asp:Label>
                        <%-- TextMode="Number": solo acepta números enteros --%>
                        <asp:TextBox ID="txtExistencias" runat="server" CssClass="form-control" TextMode="Number" placeholder="Ej: 50"></asp:TextBox>
                    </div>
                </div>
            </div>

            <%-- SECCIÓN DE BOTONES --%>
            <%-- d-grid gap-2: espaciado entre botones --%>
            <%-- d-md-flex: alinea botones horizontalmente en pantallas medianas+ --%>
            <div class="d-grid gap-2 d-md-flex justify-content-md-start mb-3">
                <%-- Botón AGREGAR: inserta nuevo producto --%>
                <%-- OnClick: evento que se ejecuta en el servidor --%>
                <asp:Button ID="btnAgregar" runat="server" Text="➕ Agregar Producto" CssClass="btn btn-primary" OnClick="btnAgregar_Click"/>
                
                <%-- Botón ACTUALIZAR: modifica producto existente --%>
                <asp:Button ID="btnActualizar" runat="server" Text="✏️ Actualizar" CssClass="btn btn-success" OnClick="btnActualizar_Click" Enabled="true"/>
                
                <%-- Botón LIMPIAR: resetea el formulario --%>
                <asp:Button ID="btnLimpiar" runat="server" Text="🗑️ Limpiar" CssClass="btn btn-secondary" OnClick="btnLimpiar_Click"/>
            </div>

            <%-- MENSAJE DE FEEDBACK --%>
            <%-- Label que muestra resultados de operaciones --%>
            <%-- Visible="false": oculto por default, se muestra cuando hay mensaje --%>
            <%-- CssClass se asigna dinámicamente en code-behind (alert-success, alert-danger, etc) --%>
            <asp:Label ID="lblMensaje" CssClass="alert alert-info d-block" runat="server" Text="" Visible="false"></asp:Label>
        </div>
    </div>

    <%-- SECCIÓN 2: TABLA DE PRODUCTOS --%>
    <%-- Card que contiene el GridView con todos los productos --%>
    <div class="card shadow-sm mt-4">
        <div class="card-header" style="background-color: #f8f9fa;">
            <h4 style="margin: 0; color: #E91E63;">📊 Productos en Inventario</h4>
        </div>
        <div class="card-body">
            <%-- GRIDVIEW: control de tabla de datos de ASP.NET --%>
            <%-- 
                Propiedades importantes:
                - AutoGenerateColumns="False": definimos columnas manualmente
                - CssClass: clases de Bootstrap para estilo
                - OnSelectedIndexChanged: evento al seleccionar una fila
                - OnRowDeleting: evento al eliminar una fila
                - DataKeyNames: define la clave primaria (para operaciones)
            --%>
            <asp:GridView ID="gridProductos" runat="server" AutoGenerateColumns="False" 
                CssClass="table table-striped table-hover" 
                OnSelectedIndexChanged="gridProductos_SelectedIndexChanged"
                OnRowDeleting="gridProductos_RowDeleting"
                DataKeyNames="codigo">
                
                <%-- Definición de columnas --%>
                <Columns>
                    <%-- COLUMNA 1: Botón para editar --%>
                    <%-- TemplateField: permite contenido personalizado --%>
                    <asp:TemplateField HeaderText="Acciones">
                        <ItemTemplate>
                            <%-- CommandName="Select": activa evento SelectedIndexChanged --%>
                            <asp:Button ID="btnSeleccionar" runat="server" CausesValidation="False" 
                                CommandName="Select" Text="✏️ Editar" CssClass="btn btn-sm btn-warning" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                    <%-- COLUMNA 2: Botón para eliminar --%>
                    <asp:TemplateField HeaderText="">
                        <ItemTemplate>
                            <%-- CommandName="Delete": activa evento RowDeleting --%>
                            <%-- OnClientClick: JavaScript que se ejecuta ANTES del postback --%>
                            <%-- return confirm(): muestra diálogo de confirmación --%>
                            <asp:Button ID="btnEliminar" runat="server" CausesValidation="False" 
                                CommandName="Delete" Text="❌ Eliminar" CssClass="btn btn-sm btn-danger"
                                OnClientClick="return confirm('¿Está seguro de eliminar este producto?');" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                    <%-- COLUMNAS DE DATOS: BoundField vincula a campos de la BD --%>
                    <%-- DataField: nombre del campo en el DataTable --%>
                    <%-- HeaderText: texto del encabezado de columna --%>
                    <asp:BoundField DataField="codigo" HeaderText="Código" />
                    <asp:BoundField DataField="nombre" HeaderText="Producto" />
                    <asp:BoundField DataField="descripcion" HeaderText="Descripción" />
                    
                    <%-- DataFormatString: formato de visualización --%>
                    <%-- {0:C}: formato de moneda (Currency) --%>
                    <asp:BoundField DataField="precio" HeaderText="Precio" DataFormatString="{0:C}" />
                    <asp:BoundField DataField="existencias" HeaderText="Existencias" />
                    
                    <%-- COLUMNA DE ESTADO: muestra indicador visual según existencias --%>
                    <asp:TemplateField HeaderText="Estado">
                        <ItemTemplate>
                            <%-- Expresión inline con operador ternario --%>
                            <%-- Eval("campo"): obtiene valor del campo --%>
                            <%-- Lógica: <= 10 = BAJO, <= 30 = MEDIO, > 30 = NORMAL --%>
                            <%# Convert.ToInt32(Eval("existencias")) <= 10 ? 
                                "<span class='badge bg-danger'>⚠️ Bajo</span>" : 
                                Convert.ToInt32(Eval("existencias")) <= 30 ? 
                                "<span class='badge bg-warning text-dark'>⚡ Medio</span>" : 
                                "<span class='badge bg-success'>✅ Normal</span>" %>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                
                <%-- EmptyDataTemplate: qué mostrar cuando no hay datos --%>
                <EmptyDataTemplate>
                    <div class="alert alert-warning text-center" role="alert">
                        🍨 No hay productos registrados en el inventario
                    </div>
                </EmptyDataTemplate>
                
                <%-- HeaderStyle: estilo de los encabezados de columna --%>
                <HeaderStyle BackColor="#E91E63" ForeColor="White" Font-Bold="true" />
            </asp:GridView>
        </div>
    </div>
</asp:Content>

<%-- 
    NOTAS TÉCNICAS:
    
    1. CONTROLES ASP.NET SERVER (runat="server"):
       - Se procesan en el servidor, no en el navegador
       - Generan HTML estándar que se envía al cliente
       - Permiten programación en C# (code-behind)
    
    2. EVENTOS:
       - OnClick (botones): se ejecuta en el servidor cuando se hace clic
       - OnSelectedIndexChanged (GridView): cuando se selecciona una fila
       - OnRowDeleting (GridView): cuando se elimina una fila
       - OnClientClick (botones): JavaScript que se ejecuta en el cliente ANTES del evento del servidor
    
    3. VALIDACIÓN:
       - TextMode="Number": validación HTML5 en el navegador
       - Validaciones adicionales en code-behind para seguridad
    
    4. BOOTSTRAP:
       - card, card-header, card-body: componentes de tarjeta
       - form-control: estilo de inputs
       - btn, btn-primary, btn-success: estilos de botones
       - table, table-striped, table-hover: estilos de tabla
       - alert: mensajes de feedback
       - row, col-md-6: sistema de grid responsive
    
    5. FLUJO DE DATOS:
       Usuario → Formulario → Botón Click → Evento en Code-Behind → 
       Clase Producto → MySQL → Resultado → GridView → Usuario
    
    6. RESPONSIVE DESIGN:
       - col-md-6: 2 columnas en pantallas medianas (≥768px)
       - En móviles (< 768px): automáticamente 1 columna (apiladas)
       - d-md-flex: flexbox en pantallas medianas+
    
    7. ACCESIBILIDAD:
       - Labels vinculados a inputs
       - Placeholders informativos
       - Mensajes claros de feedback
       - Confirmación antes de eliminar
--%>