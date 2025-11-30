using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Crud_WebForms
{
    public partial class Contact : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblMensajeContacto.Visible = false;
            }
        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            try
            {
                // Validar campos obligatorios
                if (string.IsNullOrWhiteSpace(txtNombre.Text) ||
                    string.IsNullOrWhiteSpace(txtEmail.Text) ||
                    string.IsNullOrWhiteSpace(ddlAsunto.SelectedValue) ||
                    string.IsNullOrWhiteSpace(txtMensaje.Text))
                {
                    MostrarMensaje("⚠️ Por favor complete todos los campos obligatorios (*)", "warning");
                    return;
                }

                // Validar formato de email
                if (!IsValidEmail(txtEmail.Text))
                {
                    MostrarMensaje("⚠️ Por favor ingrese un correo electrónico válido", "warning");
                    return;
                }

                // Aquí podrías agregar la lógica para:
                // 1. Guardar el mensaje en la base de datos
                // 2. Enviar un correo electrónico
                // 3. Notificar al administrador

                // Por ahora, solo mostramos un mensaje de éxito
                string mensajeExito = $"✅ ¡Gracias {txtNombre.Text}! Tu mensaje ha sido enviado correctamente. " +
                                     "Nos pondremos en contacto contigo pronto.";

                MostrarMensaje(mensajeExito, "success");

                // Limpiar el formulario
                LimpiarFormulario();
            }
            catch (Exception ex)
            {
                MostrarMensaje($"❌ Error al enviar el mensaje: {ex.Message}", "danger");
            }
        }

        private void MostrarMensaje(string mensaje, string tipo)
        {
            lblMensajeContacto.Text = mensaje;
            lblMensajeContacto.CssClass = $"alert alert-{tipo} d-block";
            lblMensajeContacto.Visible = true;
        }

        private void LimpiarFormulario()
        {
            txtNombre.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtTelefono.Text = string.Empty;
            ddlAsunto.SelectedIndex = 0;
            txtMensaje.Text = string.Empty;
        }

        private bool IsValidEmail(string email)
        {
            try
            {
                var addr = new System.Net.Mail.MailAddress(email);
                return addr.Address == email;
            }
            catch
            {
                return false;
            }
        }
    }
}