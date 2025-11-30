<%@ Page Title="Contacto" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Crud_WebForms.Contact" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <!-- Header -->
        <div class="text-center mb-5">
            <h1 id="title" style="color: #667eea; font-weight: bold;">📞 Contáctanos</h1>
            <p class="lead" style="color: #666;">Estamos aquí para servirte</p>
        </div>

        <div class="row">
            <!-- Contact Information -->
            <div class="col-md-6 mb-4">
                <div class="card shadow-sm h-100">
                    <div class="card-header text-white" style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);">
                        <h4 class="mb-0">🍦 Nevería La Paleta</h4>
                    </div>
                    <div class="card-body">
                        <h5 style="color: #667eea;">📍 Ubicación</h5>
                        <p>
                            <strong>Dirección:</strong><br>
                            Av. Principal #123<br>
                            Colonia Centro<br>
                            Aguascalientes, Ags. 20000<br>
                            México
                        </p>

                        <hr>

                        <h5 style="color: #667eea;">📞 Teléfono</h5>
                        <p>
                            <strong>Teléfono fijo:</strong> (449) 123-4567<br>
                            <strong>WhatsApp:</strong> +52 449 987-6543
                        </p>

                        <hr>

                        <h5 style="color: #667eea;">📧 Correo Electrónico</h5>
                        <p>
                            <strong>Ventas:</strong> ventas@neverialapaleta.com<br>
                            <strong>Información:</strong> info@neverialapaleta.com<br>
                            <strong>Soporte:</strong> soporte@neverialapaleta.com
                        </p>

                        <hr>

                        <h5 style="color: #667eea;">🕒 Horarios</h5>
                        <p class="mb-1"><strong>Lunes a Viernes:</strong> 10:00 AM - 9:00 PM</p>
                        <p class="mb-1"><strong>Sábados:</strong> 10:00 AM - 10:00 PM</p>
                        <p class="mb-0"><strong>Domingos:</strong> 11:00 AM - 8:00 PM</p>
                    </div>
                </div>
            </div>

            <!-- Contact Form -->
            <div class="col-md-6 mb-4">
                <div class="card shadow-sm h-100">
                    <div class="card-header text-white" style="background: linear-gradient(135deg, #764ba2 0%, #667eea 100%);">
                        <h4 class="mb-0">✉️ Envíanos un Mensaje</h4>
                    </div>
                    <div class="card-body">
                        <div class="mb-3">
                            <label for="txtNombre" class="form-label" style="color: #667eea; font-weight: bold;">
                                👤 Nombre Completo *
                            </label>
                            <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" placeholder="Tu nombre"></asp:TextBox>
                        </div>

                        <div class="mb-3">
                            <label for="txtEmail" class="form-label" style="color: #667eea; font-weight: bold;">
                                📧 Correo Electrónico *
                            </label>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" placeholder="tucorreo@ejemplo.com"></asp:TextBox>
                        </div>

                        <div class="mb-3">
                            <label for="txtTelefono" class="form-label" style="color: #667eea; font-weight: bold;">
                                📱 Teléfono
                            </label>
                            <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control" placeholder="(449) 123-4567"></asp:TextBox>
                        </div>

                        <div class="mb-3">
                            <label for="ddlAsunto" class="form-label" style="color: #667eea; font-weight: bold;">
                                📋 Asunto *
                            </label>
                            <asp:DropDownList ID="ddlAsunto" runat="server" CssClass="form-select">
                                <asp:ListItem Value="">-- Seleccione un asunto --</asp:ListItem>
                                <asp:ListItem Value="Información">Solicitud de Información</asp:ListItem>
                                <asp:ListItem Value="Pedido">Pedido Especial</asp:ListItem>
                                <asp:ListItem Value="Sugerencia">Sugerencia</asp:ListItem>
                                <asp:ListItem Value="Queja">Queja o Reclamo</asp:ListItem>
                                <asp:ListItem Value="Otro">Otro</asp:ListItem>
                            </asp:DropDownList>
                        </div>

                        <div class="mb-3">
                            <label for="txtMensaje" class="form-label" style="color: #667eea; font-weight: bold;">
                                💬 Mensaje *
                            </label>
                            <asp:TextBox ID="txtMensaje" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4" placeholder="Escribe tu mensaje aquí..."></asp:TextBox>
                        </div>

                        <div class="d-grid">
                            <asp:Button ID="btnEnviar" runat="server" Text="📤 Enviar Mensaje" CssClass="btn btn-primary btn-lg" OnClick="btnEnviar_Click" />
                        </div>

                        <asp:Label ID="lblMensajeContacto" runat="server" CssClass="alert d-block mt-3" Visible="false"></asp:Label>
                    </div>
                </div>
            </div>
        </div>

        <!-- Social Media Section -->
        <div class="row mt-4">
            <div class="col-md-12">
                <div class="card shadow-sm">
                    <div class="card-body text-center">
                        <h4 style="color: #667eea; margin-bottom: 20px;">🌐 Síguenos en Redes Sociales</h4>
                        <div class="d-flex justify-content-center gap-3 flex-wrap">
                            <a href="#" class="btn btn-primary btn-lg" style="background: #1877f2; border: none;">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" viewBox="0 0 16 16">
                                    <path d="M16 8.049c0-4.446-3.582-8.05-8-8.05C3.58 0-.002 3.603-.002 8.05c0 4.017 2.926 7.347 6.75 7.951v-5.625h-2.03V8.05H6.75V6.275c0-2.017 1.195-3.131 3.022-3.131.876 0 1.791.157 1.791.157v1.98h-1.009c-.993 0-1.303.621-1.303 1.258v1.51h2.218l-.354 2.326H9.25V16c3.824-.604 6.75-3.934 6.75-7.951z"/>
                                </svg>
                                Facebook
                            </a>
                            <a href="#" class="btn btn-danger btn-lg" style="background: #E4405F; border: none;">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" viewBox="0 0 16 16">
                                    <path d="M8 0C5.829 0 5.556.01 4.703.048 3.85.088 3.269.222 2.76.42a3.917 3.917 0 0 0-1.417.923A3.927 3.927 0 0 0 .42 2.76C.222 3.268.087 3.85.048 4.7.01 5.555 0 5.827 0 8.001c0 2.172.01 2.444.048 3.297.04.852.174 1.433.372 1.942.205.526.478.972.923 1.417.444.445.89.719 1.416.923.51.198 1.09.333 1.942.372C5.555 15.99 5.827 16 8 16s2.444-.01 3.298-.048c.851-.04 1.434-.174 1.943-.372a3.916 3.916 0 0 0 1.416-.923c.445-.445.718-.891.923-1.417.197-.509.332-1.09.372-1.942C15.99 10.445 16 10.173 16 8s-.01-2.445-.048-3.299c-.04-.851-.175-1.433-.372-1.941a3.926 3.926 0 0 0-.923-1.417A3.911 3.911 0 0 0 13.24.42c-.51-.198-1.092-.333-1.943-.372C10.443.01 10.172 0 7.998 0h.003zm-.717 1.442h.718c2.136 0 2.389.007 3.232.046.78.035 1.204.166 1.486.275.373.145.64.319.92.599.28.28.453.546.598.92.11.281.24.705.275 1.485.039.843.047 1.096.047 3.231s-.008 2.389-.047 3.232c-.035.78-.166 1.203-.275 1.485a2.47 2.47 0 0 1-.599.919c-.28.28-.546.453-.92.598-.28.11-.704.24-1.485.276-.843.038-1.096.047-3.232.047s-2.39-.009-3.233-.047c-.78-.036-1.203-.166-1.485-.276a2.478 2.478 0 0 1-.92-.598 2.48 2.48 0 0 1-.6-.92c-.109-.281-.24-.705-.275-1.485-.038-.843-.046-1.096-.046-3.233 0-2.136.008-2.388.046-3.231.036-.78.166-1.204.276-1.486.145-.373.319-.64.599-.92.28-.28.546-.453.92-.598.282-.11.705-.24 1.485-.276.738-.034 1.024-.044 2.515-.045v.002zm4.988 1.328a.96.96 0 1 0 0 1.92.96.96 0 0 0 0-1.92zm-4.27 1.122a4.109 4.109 0 1 0 0 8.217 4.109 4.109 0 0 0 0-8.217zm0 1.441a2.667 2.667 0 1 1 0 5.334 2.667 2.667 0 0 1 0-5.334z"/>
                                </svg>
                                Instagram
                            </a>
                            <a href="#" class="btn btn-success btn-lg" style="background: #25D366; border: none;">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" viewBox="0 0 16 16">
                                    <path d="M13.601 2.326A7.854 7.854 0 0 0 7.994 0C3.627 0 .068 3.558.064 7.926c0 1.399.366 2.76 1.057 3.965L0 16l4.204-1.102a7.933 7.933 0 0 0 3.79.965h.004c4.368 0 7.926-3.558 7.93-7.93A7.898 7.898 0 0 0 13.6 2.326zM7.994 14.521a6.573 6.573 0 0 1-3.356-.92l-.24-.144-2.494.654.666-2.433-.156-.251a6.56 6.56 0 0 1-1.007-3.505c0-3.626 2.957-6.584 6.591-6.584a6.56 6.56 0 0 1 4.66 1.931 6.557 6.557 0 0 1 1.928 4.66c-.004 3.639-2.961 6.592-6.592 6.592zm3.615-4.934c-.197-.099-1.17-.578-1.353-.646-.182-.065-.315-.099-.445.099-.133.197-.513.646-.627.775-.114.133-.232.148-.43.05-.197-.1-.836-.308-1.592-.985-.59-.525-.985-1.175-1.103-1.372-.114-.198-.011-.304.088-.403.087-.088.197-.232.296-.346.1-.114.133-.198.198-.33.065-.134.034-.248-.015-.347-.05-.099-.445-1.076-.612-1.47-.16-.389-.323-.335-.445-.34-.114-.007-.247-.007-.38-.007a.729.729 0 0 0-.529.247c-.182.198-.691.677-.691 1.654 0 .977.71 1.916.81 2.049.098.133 1.394 2.132 3.383 2.992.47.205.84.326 1.129.418.475.152.904.129 1.246.08.38-.058 1.171-.48 1.338-.943.164-.464.164-.86.114-.943-.049-.084-.182-.133-.38-.232z"/>
                                </svg>
                                WhatsApp
                            </a>
                            <a href="#" class="btn btn-info btn-lg" style="background: #1DA1F2; border: none;">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" viewBox="0 0 16 16">
                                    <path d="M5.026 15c6.038 0 9.341-5.003 9.341-9.334 0-.14 0-.282-.006-.422A6.685 6.685 0 0 0 16 3.542a6.658 6.658 0 0 1-1.889.518 3.301 3.301 0 0 0 1.447-1.817 6.533 6.533 0 0 1-2.087.793A3.286 3.286 0 0 0 7.875 6.03a9.325 9.325 0 0 1-6.767-3.429 3.289 3.289 0 0 0 1.018 4.382A3.323 3.323 0 0 1 .64 6.575v.045a3.288 3.288 0 0 0 2.632 3.218 3.203 3.203 0 0 1-.865.115 3.23 3.23 0 0 1-.614-.057 3.283 3.283 0 0 0 3.067 2.277A6.588 6.588 0 0 1 .78 13.58a6.32 6.32 0 0 1-.78-.045A9.344 9.344 0 0 0 5.026 15z"/>
                                </svg>
                                Twitter
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Map Section (Optional) -->
        <div class="row mt-4">
            <div class="col-md-12">
                <div class="card shadow-sm">
                    <div class="card-header text-white" style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);">
                        <h4 class="mb-0">🗺️ Encuéntranos</h4>
                    </div>
                    <div class="card-body p-0">
                        <div style="width: 100%; height: 400px; background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%); display: flex; align-items: center; justify-content: center;">
                            <div class="text-center">
                                <h5 style="color: #667eea;">📍 Mapa de Ubicación</h5>
                                <p class="text-muted">Aquí puedes agregar un mapa de Google Maps embebido</p>
                                <p class="text-muted">Av. Principal #123, Centro, Aguascalientes</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Additional Info -->
        <div class="alert alert-info mt-4" role="alert">
            <h5 class="alert-heading">💡 ¿Necesitas hacer un pedido especial?</h5>
            <p>Contamos con servicio de pedidos especiales para eventos, fiestas y celebraciones. 
            Contáctanos con al menos 48 horas de anticipación para garantizar disponibilidad.</p>
            <hr>
            <p class="mb-0">📞 Llámanos o envíanos un WhatsApp para cotizaciones personalizadas.</p>
        </div>
    </main>
</asp:Content>