<%-- 
    Archivo: Consultas.aspx
    Propósito: Página de consultas avanzadas y reportes del inventario
    Autor: [Tu Nombre]
    Fecha: [Fecha]
    Descripción: Proporciona 5 tipos diferentes de consultas para análisis del inventario
    Tipos: Por código, por nombre, inventario bajo, estadísticas, listado completo
--%>

<%@ Page Title="Consultas" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Consultas.aspx.cs" Inherits="Crud_WebForms.Consultas" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        
        <%-- ENCABEZADO DE LA PÁGINA --%>
        <div class="text-center mb-4">
            <h1 id="title" style="color: #E91E63; font-weight: bold;">📊 Consultas y Reportes</h1>
            <p class="lead" style="color: #666;">Consulta información específica del inventario</p>
        </div>

        <%-- ============================================
             CONSULTA TIPO 1: BÚSQUEDA POR CÓDIGO
             Búsqueda exacta de un producto específico
             ============================================ --%>
        <div class="card shadow-sm mb-4">
            <%-- Header con gradiente rosa --%>
            <div class="card-header text-white" style="background: linear-gradient(135deg, #E91E63 0%, #FF69B4 100%);">
                <h4 class="mb-0">🔍 Consulta por Código de Producto</h4>
            </div>
            <div class="card-body">
                <%-- Formulario de búsqueda --%>
                <div class="row">
                    <div class="col-md-8">
                        <asp:Label ID="lblBuscarCodigo" runat="server" CssClass="form-label" ForeColor="#E91E63" Font-Bold="true">
                            Ingrese el código del producto:
                        </asp:Label>
                        <asp:TextBox ID="txtBuscarCodigo" runat="server" CssClass="form-control" placeholder="Ej: PAL001"></asp:TextBox>
                    </div>
                    <div class="col-md-4 d-flex align-items-end">
                        <%-- Botón de búsqueda --%>
                        <asp:Button ID="btnBuscarCodigo" runat="server" Text="🔎 Buscar" CssClass="btn btn-primary w-100" OnClick="btnBuscarCodigo_Click"/>
                    </div>
                </div>
                
                <%-- Mensaje de resultado de búsqueda --%>
                <asp:Label ID="lblMensajeCodigo" runat="server" CssClass="alert d-block mt-3" Visible="false"></asp:Label>
                
                <%-- PANEL DE RESULTADO: Se muestra solo si se encuentra el producto --%>
                <%-- Visible="false": oculto por default, se muestra en code-behind --%>
                <asp:Panel ID="panelResultadoCodigo" runat="server" Visible="false" CssClass="mt-3">
                    <div class="card bg-light">
                        <div class="card-body">
                            <h5 class="card-title" style="color: #E91E63;">📦 Información del Producto</h5>
                            <%-- Tabla HTML con información detallada --%>
                            <table class="table table-bordered">
                                <%-- Cada fila muestra un campo del producto --%>
                                <tr>
                                    <th style="width: 30%; background-color: #E91E63; color: white;">Código</th>
                                    <%-- Label que se llena dinámicamente en code-behind --%>
                                    <td><asp:Label ID="lblResultCodigo" runat="server"></asp:Label></td>
                                </tr>
                                <tr>
                                    <th style="background-color: #E91E63; color: white;">Nombre</th>
                                    <td><asp:Label ID="lblResultNombre" runat="server"></asp:Label></td>
                                </tr>
                                <tr>
                                    <th style="background-color: #E91E63; color: white;">Descripción</th>
                                    <td><asp:Label ID="lblResultDescripcion" runat="server"></asp:Label></td>
                                </tr>
                                <tr>
                                    <th style="background-color: #E91E63; color: white;">Precio</th>
                                    <td><asp:Label ID="lblResultPrecio" runat="server"></asp:Label></td>
                                </tr>
                                <tr>
                                    <th style="background-color: #E91E63; color: white;">Existencias</th>
                                    <td><asp:Label ID="lblResultExistencias" runat="server"></asp:Label></td>
                                </tr>
                                <tr>
                                    <th style="background-color: #E91E63; color: white;">Estado</th>
                                    <%-- Badge de estado calculado dinámicamente --%>
                                    <td><asp:Label ID="lblResultEstado" runat="server"></asp:Label></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </asp:Panel>
            </div>
        </div>

        <%-- ============================================
             CONSULTA TIPO 2: BÚSQUEDA POR NOMBRE
             Búsqueda parcial usando LIKE en SQL
             ============================================ --%>
        <div class="card shadow-sm mb-4">
            <div class="card-header text-white" style="background: linear-gradient(135deg, #FF69B4 0%, #E91E63 100%);">
                <h4 class="mb-0">🔍 Consulta por Nombre de Producto</h4>
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-md-8">
                        <asp:Label ID="lblBuscarNombre" runat="server" CssClass="form-label" ForeColor="#E91E63" Font-Bold="true">
                            Ingrese el nombre o parte del nombre:
                        </asp:Label>
                        <%-- Búsqueda parcial: "Paleta" encuentra "Paleta de Fresa", "Paleta de Limón", etc. --%>
                        <asp:TextBox ID="txtBuscarNombre" runat="server" CssClass="form-control" placeholder="Ej: Paleta, Nieve, Helado"></asp:TextBox>
                    </div>
                    <div class="col-md-4 d-flex align-items-end">
                        <asp:Button ID="btnBuscarNombre" runat="server" Text="🔎 Buscar" CssClass="btn btn-primary w-100" OnClick="btnBuscarNombre_Click"/>
                    </div>
                </div>
                
                <asp:Label ID="lblMensajeNombre" runat="server" CssClass="alert d-block mt-3" Visible="false"></asp:Label>
                
                <%-- GridView para mostrar múltiples resultados --%>
                <div class="mt-3">
                    <%-- Visible="false": se muestra solo cuando hay resultados --%>
                    <asp:GridView ID="gridResultadosNombre" runat="server" AutoGenerateColumns="False" 
                        CssClass="table table-striped table-hover" Visible="false">
                        <Columns>
                            <%-- Columnas de datos vinculadas a la base de datos --%>
                            <asp:BoundField DataField="codigo" HeaderText="Código" />
                            <asp:BoundField DataField="nombre" HeaderText="Nombre" />
                            <asp:BoundField DataField="descripcion" HeaderText="Descripción" />
                            <asp:BoundField DataField="precio" HeaderText="Precio" DataFormatString="{0:C}" />
                            <asp:BoundField DataField="existencias" HeaderText="Existencias" />
                        </Columns>
                        <HeaderStyle BackColor="#E91E63" ForeColor="White" Font-Bold="true" />
                        <%-- Mensaje cuando no hay resultados --%>
                        <EmptyDataTemplate>
                            <div class="alert alert-warning text-center" role="alert">
                                No se encontraron productos con ese nombre
                            </div>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>
            </div>
        </div>

        <%-- ============================================
             CONSULTA TIPO 3: INVENTARIO BAJO
             Productos que necesitan reabastecimiento
             ============================================ --%>
        <div class="card shadow-sm mb-4">
            <div class="card-header text-white" style="background: linear-gradient(135deg, #E91E63 0%, #FF69B4 100%);">
                <h4 class="mb-0">⚠️ Productos con Inventario Bajo</h4>
            </div>
            <div class="card-body">
                <div class="row mb-3">
                    <div class="col-md-8">
                        <asp:Label ID="lblCantidadMinima" runat="server" CssClass="form-label" ForeColor="#E91E63" Font-Bold="true">
                            Cantidad mínima de existencias:
                        </asp:Label>
                        <%-- TextMode="Number": solo acepta números --%>
                        <%-- Text="10": valor por defecto --%>
                        <asp:TextBox ID="txtCantidadMinima" runat="server" CssClass="form-control" Text="10" TextMode="Number"></asp:TextBox>
                        <small class="text-muted">Muestra productos con existencias menores o iguales a este valor</small>
                    </div>
                    <div class="col-md-4 d-flex align-items-end">
                        <%-- btn-warning: color amarillo/naranja para advertencia --%>
                        <asp:Button ID="btnInventarioBajo" runat="server" Text="📉 Consultar" CssClass="btn btn-warning w-100" OnClick="btnInventarioBajo_Click"/>
                    </div>
                </div>
                
                <asp:Label ID="lblMensajeInventario" runat="server" CssClass="alert d-block mt-3" Visible="false"></asp:Label>
                
                <div class="mt-3">
                    <asp:GridView ID="gridInventarioBajo" runat="server" AutoGenerateColumns="False" 
                        CssClass="table table-striped table-hover" Visible="false">
                        <Columns>
                            <asp:BoundField DataField="codigo" HeaderText="Código" />
                            <asp:BoundField DataField="nombre" HeaderText="Producto" />
                            <asp:BoundField DataField="precio" HeaderText="Precio" DataFormatString="{0:C}" />
                            <asp:BoundField DataField="existencias" HeaderText="Existencias" />
                            
                            <%-- Columna especial: muestra prioridad según existencias --%>
                            <asp:TemplateField HeaderText="Prioridad">
                                <ItemTemplate>
                                    <%-- Lógica de prioridad:
                                         <= 5: CRÍTICO (rojo)
                                         <= 10: BAJO (amarillo)
                                         > 10: MEDIO (azul) --%>
                                    <%# Convert.ToInt32(Eval("existencias")) <= 5 ? 
                                        "<span class='badge bg-danger'>🔴 CRÍTICO</span>" : 
                                        Convert.ToInt32(Eval("existencias")) <= 10 ? 
                                        "<span class='badge bg-warning text-dark'>🟡 BAJO</span>" : 
                                        "<span class='badge bg-info'>🔵 MEDIO</span>" %>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <HeaderStyle BackColor="#E91E63" ForeColor="White" Font-Bold="true" />
                        <%-- Mensaje positivo cuando no hay productos con inventario bajo --%>
                        <EmptyDataTemplate>
                            <div class="alert alert-success text-center" role="alert">
                                ✅ No hay productos con inventario bajo
                            </div>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>
            </div>
        </div>

        <%-- ============================================
             CONSULTA TIPO 4: ESTADÍSTICAS GENERALES
             Métricas agregadas del inventario completo
             ============================================ --%>
        <div class="card shadow-sm mb-4">
            <div class="card-header text-white" style="background: linear-gradient(135deg, #FF69B4 0%, #E91E63 100%);">
                <h4 class="mb-0">📈 Estadísticas Generales del Inventario</h4>
            </div>
            <div class="card-body">
                <%-- Botón para generar estadísticas --%>
                <asp:Button ID="btnEstadisticas" runat="server" Text="📊 Generar Estadísticas" CssClass="btn btn-success mb-3" OnClick="btnEstadisticas_Click"/>
                
                <%-- Panel de estadísticas: 4 tarjetas con métricas --%>
                <asp:Panel ID="panelEstadisticas" runat="server" Visible="false">
                    <div class="row">
                        <%-- MÉTRICA 1: Total de productos diferentes --%>
                        <div class="col-md-3 mb-3">
                            <div class="card text-center" style="border-left: 5px solid #E91E63;">
                                <div class="card-body">
                                    <h6 class="text-muted">Total Productos</h6>
                                    <%-- Label que se llena con COUNT(*) --%>
                                    <h2 style="color: #E91E63;"><asp:Label ID="lblTotalProductos" runat="server"></asp:Label></h2>
                                </div>
                            </div>
                        </div>
                        
                        <%-- MÉTRICA 2: Suma de todas las existencias --%>
                        <div class="col-md-3 mb-3">
                            <div class="card text-center" style="border-left: 5px solid #FF69B4;">
                                <div class="card-body">
                                    <h6 class="text-muted">Total Unidades</h6>
                                    <%-- Label que se llena con SUM(existencias) --%>
                                    <h2 style="color: #FF69B4;"><asp:Label ID="lblTotalUnidades" runat="server"></asp:Label></h2>
                                </div>
                            </div>
                        </div>
                        
                        <%-- MÉTRICA 3: Valor monetario total del inventario --%>
                        <div class="col-md-3 mb-3">
                            <div class="card text-center" style="border-left: 5px solid #28a745;">
                                <div class="card-body">
                                    <h6 class="text-muted">Valor Total</h6>
                                    <%-- Label que se llena con SUM(precio * existencias) --%>
                                    <h2 style="color: #28a745;"><asp:Label ID="lblValorTotal" runat="server"></asp:Label></h2>
                                </div>
                            </div>
                        </div>
                        
                        <%-- MÉTRICA 4: Precio promedio de productos --%>
                        <div class="col-md-3 mb-3">
                            <div class="card text-center" style="border-left: 5px solid #ffc107;">
                                <div class="card-body">
                                    <h6 class="text-muted">Precio Promedio</h6>
                                    <%-- Label que se llena con AVG(precio) --%>
                                    <h2 style="color: #ffc107;"><asp:Label ID="lblPrecioPromedio" runat="server"></asp:Label></h2>
                                </div>
                            </div>
                        </div>
                    </div>
                </asp:Panel>
            </div>
        </div>

        <%-- ============================================
             CONSULTA TIPO 5: LISTADO COMPLETO
             Todos los productos con todos los campos
             ============================================ --%>
        <div class="card shadow-sm mb-4">
            <div class="card-header text-white" style="background: linear-gradient(135deg, #E91E63 0%, #FF69B4 100%);">
                <h4 class="mb-0">📋 Listado Completo de Productos</h4>
            </div>
            <div class="card-body">
                <asp:Button ID="btnListarTodos" runat="server" Text="📄 Ver Todos los Productos" CssClass="btn btn-info mb-3" OnClick="btnListarTodos_Click"/>
                
                <div class="mt-3">
                    <%-- GridView con TODOS los campos incluyendo fechas --%>
                    <asp:GridView ID="gridTodosProductos" runat="server" AutoGenerateColumns="False" 
                        CssClass="table table-striped table-hover" Visible="false">
                        <Columns>
                            <asp:BoundField DataField="codigo" HeaderText="Código" />
                            <asp:BoundField DataField="nombre" HeaderText="Nombre" />
                            <asp:BoundField DataField="descripcion" HeaderText="Descripción" />
                            <asp:BoundField DataField="precio" HeaderText="Precio" DataFormatString="{0:C}" />
                            <asp:BoundField DataField="existencias" HeaderText="Existencias" />
                            <%-- Campo de fecha con formato dd/MM/yyyy --%>
                            <asp:BoundField DataField="fecha_registro" HeaderText="Fecha Registro" DataFormatString="{0:dd/MM/yyyy}" />
                        </Columns>
                        <HeaderStyle BackColor="#E91E63" ForeColor="White" Font-Bold="true" />
                    </asp:GridView>
                </div>
            </div>
        </div>
    </main>
</asp:Content>

<%-- 
    RESUMEN DE TIPOS DE CONSULTA:
    
    1. BÚSQUEDA POR CÓDIGO (Exacta):
       - Input: Código específico (ej: PAL001)
       - Output: Un producto o ninguno
       - SQL: SELECT * WHERE codigo = @codigo
       - Uso: Encontrar producto específico rápidamente
    
    2. BÚSQUEDA POR NOMBRE (Parcial):
       - Input: Parte del nombre (ej: "Paleta")
       - Output: Todos los productos que contienen ese texto
       - SQL: SELECT * WHERE nombre LIKE '%texto%'
       - Uso: Cuando no recuerdas el código exacto
    
    3. INVENTARIO BAJO (Filtro):
       - Input: Cantidad mínima (ej: 10)
       - Output: Productos con existencias <= cantidad
       - SQL: SELECT * WHERE existencias <= @cantidad
       - Uso: Identificar productos a reabastecer
    
    4. ESTADÍSTICAS (Agregación):
       - Input: Ninguno (usa todos los productos)
       - Output: Métricas calculadas
       - SQL: SELECT COUNT(*), SUM(...), AVG(...)
       - Uso: Vista general del negocio
    
    5. LISTADO COMPLETO (Todo):
       - Input: Ninguno
       - Output: Todos los productos, todos los campos
       - SQL: SELECT *
       - Uso: Reportes completos, auditoría
    
    VENTAJAS DE MÚLTIPLES CONSULTAS:
    - Flexibilidad para diferentes necesidades
    - Información rápida según contexto
    - Herramientas para toma de decisiones
    - Identificación proactiva de problemas
    
    CONTROLES ASP.NET UTILIZADOS:
    - TextBox: entrada de datos
    - Button: ejecutar consultas
    - Label: mostrar mensajes y resultados
    - GridView: tablas de datos
    - Panel: contenedores que se muestran/ocultan
    
    PATRÓN DE DISEÑO:
    Cada consulta sigue el mismo patrón:
    1. Input (TextBox)
    2. Botón de acción
    3. Mensaje de feedback (Label)
    4. Resultados (GridView o Panel)
    5. Manejo en code-behind
--%>