using Modelo;
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Crud_WebForms
{
    public partial class Consultas : Page
    {
        Producto producto;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Inicializar
            }
        }

        // Consulta por Código
        protected void btnBuscarCodigo_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrWhiteSpace(txtBuscarCodigo.Text))
                {
                    MostrarMensaje(lblMensajeCodigo, "⚠️ Por favor ingrese un código de producto", "warning");
                    panelResultadoCodigo.Visible = false;
                    return;
                }

                producto = new Producto();
                DataTable dt = producto.buscarProducto(txtBuscarCodigo.Text.Trim());

                if (dt.Rows.Count > 0)
                {
                    DataRow row = dt.Rows[0];

                    lblResultCodigo.Text = row["codigo"].ToString();
                    lblResultNombre.Text = row["nombre"].ToString();
                    lblResultDescripcion.Text = row["descripcion"].ToString();
                    lblResultPrecio.Text = Convert.ToDecimal(row["precio"]).ToString("C");

                    int existencias = Convert.ToInt32(row["existencias"]);
                    lblResultExistencias.Text = existencias.ToString() + " unidades";

                    // Determinar estado
                    if (existencias <= 10)
                        lblResultEstado.Text = "<span class='badge bg-danger'>⚠️ INVENTARIO BAJO</span>";
                    else if (existencias <= 30)
                        lblResultEstado.Text = "<span class='badge bg-warning text-dark'>⚡ INVENTARIO MEDIO</span>";
                    else
                        lblResultEstado.Text = "<span class='badge bg-success'>✅ INVENTARIO NORMAL</span>";

                    panelResultadoCodigo.Visible = true;
                    MostrarMensaje(lblMensajeCodigo, "✅ Producto encontrado", "success");
                }
                else
                {
                    panelResultadoCodigo.Visible = false;
                    MostrarMensaje(lblMensajeCodigo, "❌ No se encontró ningún producto con ese código", "danger");
                }
            }
            catch (Exception ex)
            {
                panelResultadoCodigo.Visible = false;
                MostrarMensaje(lblMensajeCodigo, $"❌ Error: {ex.Message}", "danger");
            }
        }

        // Consulta por Nombre
        protected void btnBuscarNombre_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrWhiteSpace(txtBuscarNombre.Text))
                {
                    MostrarMensaje(lblMensajeNombre, "⚠️ Por favor ingrese un nombre o parte del nombre", "warning");
                    gridResultadosNombre.Visible = false;
                    return;
                }

                producto = new Producto();
                DataTable dt = producto.buscarPorNombre(txtBuscarNombre.Text.Trim());

                if (dt.Rows.Count > 0)
                {
                    gridResultadosNombre.DataSource = dt;
                    gridResultadosNombre.DataBind();
                    gridResultadosNombre.Visible = true;
                    MostrarMensaje(lblMensajeNombre, $"✅ Se encontraron {dt.Rows.Count} producto(s)", "success");
                }
                else
                {
                    gridResultadosNombre.Visible = false;
                    MostrarMensaje(lblMensajeNombre, "❌ No se encontraron productos con ese nombre", "warning");
                }
            }
            catch (Exception ex)
            {
                gridResultadosNombre.Visible = false;
                MostrarMensaje(lblMensajeNombre, $"❌ Error: {ex.Message}", "danger");
            }
        }

        // Consulta Inventario Bajo
        protected void btnInventarioBajo_Click(object sender, EventArgs e)
        {
            try
            {
                int cantidadMinima = 10;
                if (!string.IsNullOrWhiteSpace(txtCantidadMinima.Text))
                {
                    cantidadMinima = Convert.ToInt32(txtCantidadMinima.Text);
                }

                producto = new Producto();
                DataTable dt = producto.productosInventarioBajo(cantidadMinima);

                if (dt.Rows.Count > 0)
                {
                    gridInventarioBajo.DataSource = dt;
                    gridInventarioBajo.DataBind();
                    gridInventarioBajo.Visible = true;
                    MostrarMensaje(lblMensajeInventario, $"⚠️ Se encontraron {dt.Rows.Count} producto(s) con inventario bajo", "warning");
                }
                else
                {
                    gridInventarioBajo.Visible = false;
                    MostrarMensaje(lblMensajeInventario, "✅ No hay productos con inventario bajo. ¡Todo bien!", "success");
                }
            }
            catch (Exception ex)
            {
                gridInventarioBajo.Visible = false;
                MostrarMensaje(lblMensajeInventario, $"❌ Error: {ex.Message}", "danger");
            }
        }

        // Estadísticas Generales
        protected void btnEstadisticas_Click(object sender, EventArgs e)
        {
            try
            {
                producto = new Producto();

                // Total de productos
                int totalProductos = producto.contarProductos();
                lblTotalProductos.Text = totalProductos.ToString();

                // Valor total del inventario
                decimal valorTotal = producto.valorTotalInventario();
                lblValorTotal.Text = valorTotal.ToString("C");

                // Calcular total de unidades y precio promedio
                DataTable dt = producto.obtenerTodosProductos();

                int totalUnidades = 0;
                decimal sumaPrecios = 0;

                foreach (DataRow row in dt.Rows)
                {
                    totalUnidades += Convert.ToInt32(row["existencias"]);
                    sumaPrecios += Convert.ToDecimal(row["precio"]);
                }

                lblTotalUnidades.Text = totalUnidades.ToString();

                decimal precioPromedio = totalProductos > 0 ? sumaPrecios / totalProductos : 0;
                lblPrecioPromedio.Text = precioPromedio.ToString("C");

                panelEstadisticas.Visible = true;
            }
            catch (Exception ex)
            {
                panelEstadisticas.Visible = false;
                // Mostrar error (podrías agregar un label para esto)
            }
        }

        // Listar Todos los Productos
        protected void btnListarTodos_Click(object sender, EventArgs e)
        {
            try
            {
                producto = new Producto();
                DataTable dt = producto.obtenerTodosProductos();

                if (dt.Rows.Count > 0)
                {
                    gridTodosProductos.DataSource = dt;
                    gridTodosProductos.DataBind();
                    gridTodosProductos.Visible = true;
                }
                else
                {
                    gridTodosProductos.Visible = false;
                }
            }
            catch (Exception ex)
            {
                gridTodosProductos.Visible = false;
            }
        }

        // Método auxiliar para mostrar mensajes
        private void MostrarMensaje(Label label, string mensaje, string tipo)
        {
            label.Text = mensaje;
            label.CssClass = $"alert alert-{tipo} d-block";
            label.Visible = true;
        }
    }
}