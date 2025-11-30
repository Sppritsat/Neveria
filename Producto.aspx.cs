using Modelo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Crud_WebForms
{
    public partial class tiendita_jeod : System.Web.UI.Page
    {
        Producto producto;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                producto = new Producto();
                producto.gridProductos(gridProductos);
                lblMensaje.Visible = false;
            }
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            try
            {
                // Validar que los campos no estén vacíos
                if (string.IsNullOrWhiteSpace(txtCodigo.Text) ||
                    string.IsNullOrWhiteSpace(txtProducto.Text) ||
                    string.IsNullOrWhiteSpace(txtPrecio.Text) ||
                    string.IsNullOrWhiteSpace(txtExistencias.Text))
                {
                    MostrarMensaje("⚠️ Por favor complete todos los campos obligatorios", "warning");
                    return;
                }

                producto = new Producto();
                int ejecuta = producto.agregarProducto(
                    txtCodigo.Text.Trim(),
                    txtProducto.Text.Trim(),
                    txtDescripcion.Text.Trim(),
                    Convert.ToDecimal(txtPrecio.Text),
                    Convert.ToInt32(txtExistencias.Text)
                );

                if (ejecuta > 0)
                {
                    producto.gridProductos(gridProductos);
                    LimpiarCampos();
                    MostrarMensaje("✅ Producto agregado exitosamente al inventario", "success");
                }
                else
                {
                    MostrarMensaje("❌ Error: No se pudo agregar el producto", "danger");
                }
            }
            catch (Exception ex)
            {
                MostrarMensaje($"❌ Error: {ex.Message}", "danger");
            }
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            try
            {
                // Validar que hay un código (producto seleccionado)
                if (string.IsNullOrWhiteSpace(txtCodigo.Text))
                {
                    MostrarMensaje("⚠️ Seleccione un producto para actualizar", "warning");
                    return;
                }

                // Validar campos obligatorios
                if (string.IsNullOrWhiteSpace(txtProducto.Text) ||
                    string.IsNullOrWhiteSpace(txtPrecio.Text) ||
                    string.IsNullOrWhiteSpace(txtExistencias.Text))
                {
                    MostrarMensaje("⚠️ Por favor complete todos los campos obligatorios", "warning");
                    return;
                }

                // Validar que precio y existencias sean numéricos
                decimal precio;
                int existencias;

                if (!decimal.TryParse(txtPrecio.Text, out precio))
                {
                    MostrarMensaje("⚠️ El precio debe ser un número válido", "warning");
                    return;
                }

                if (!int.TryParse(txtExistencias.Text, out existencias))
                {
                    MostrarMensaje("⚠️ Las existencias deben ser un número entero válido", "warning");
                    return;
                }

                producto = new Producto();
                int ejecuta = producto.actualizarProducto(
                    txtCodigo.Text.Trim(),
                    txtProducto.Text.Trim(),
                    txtDescripcion.Text.Trim(),
                    precio,
                    existencias
                );

                if (ejecuta > 0)
                {
                    producto.gridProductos(gridProductos);
                    LimpiarCampos();
                    MostrarMensaje("✅ Producto actualizado correctamente", "success");
                }
                else
                {
                    MostrarMensaje("❌ Error: No se pudo actualizar el producto. Verifique que el código exista.", "danger");
                }
            }
            catch (Exception ex)
            {
                MostrarMensaje($"❌ Error: {ex.Message}", "danger");
            }
        }

        protected void btnLimpiar_Click(object sender, EventArgs e)
        {
            LimpiarCampos();
            lblMensaje.Visible = false;
        }

        protected void gridProductos_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                GridViewRow row = gridProductos.SelectedRow;

                // Verificar que DataKeys tenga valores
                if (gridProductos.DataKeys.Count > 0 && row.RowIndex >= 0)
                {
                    // Usar DataKeys para obtener el código de forma segura
                    txtCodigo.Text = gridProductos.DataKeys[row.RowIndex].Value.ToString();
                    txtCodigo.ReadOnly = true; // Bloquear edición del código

                    txtProducto.Text = row.Cells[3].Text;

                    // Manejar descripción que puede contener &nbsp;
                    string descripcion = row.Cells[4].Text;
                    if (descripcion == "&nbsp;")
                        txtDescripcion.Text = "";
                    else
                        txtDescripcion.Text = descripcion;

                    // Limpiar formato de moneda del precio
                    string precioText = row.Cells[5].Text.Replace("$", "").Replace(",", "").Trim();
                    txtPrecio.Text = precioText;

                    txtExistencias.Text = row.Cells[6].Text;

                    btnAgregar.Enabled = false;
                    btnActualizar.Enabled = true;
                    MostrarMensaje("✏️ Producto seleccionado para edición. Modifique los campos y presione Actualizar.", "info");
                }
                else
                {
                    MostrarMensaje("⚠️ Error al seleccionar el producto", "warning");
                }
            }
            catch (Exception ex)
            {
                MostrarMensaje($"❌ Error al seleccionar: {ex.Message}", "danger");
            }
        }

        protected void gridProductos_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                // Obtener el código del producto usando DataKeys
                string codigo = gridProductos.DataKeys[e.RowIndex].Value.ToString();

                producto = new Producto();
                int ejecuta = producto.eliminarProducto(codigo);

                if (ejecuta > 0)
                {
                    producto.gridProductos(gridProductos);
                    LimpiarCampos();
                    MostrarMensaje("✅ Producto eliminado del inventario", "success");
                }
                else
                {
                    MostrarMensaje("❌ Error: No se pudo eliminar el producto", "danger");
                }
            }
            catch (Exception ex)
            {
                MostrarMensaje($"❌ Error: {ex.Message}", "danger");
            }
        }

        private void LimpiarCampos()
        {
            txtCodigo.Text = string.Empty;
            txtCodigo.ReadOnly = false; // Permitir edición del código nuevamente
            txtProducto.Text = string.Empty;
            txtDescripcion.Text = string.Empty;
            txtPrecio.Text = string.Empty;
            txtExistencias.Text = string.Empty;

            btnAgregar.Enabled = true;
            btnActualizar.Enabled = true;
            txtCodigo.Focus();
        }

        private void MostrarMensaje(string mensaje, string tipo)
        {
            lblMensaje.Text = mensaje;
            lblMensaje.CssClass = $"alert alert-{tipo} d-block";
            lblMensaje.Visible = true;
        }
    }
}