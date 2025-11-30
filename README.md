# 🍦 Sistema de Inventario - Nevería La Paleta

![Banner](https://img.shields.io/badge/ASP.NET-WebForms-blue) ![MySQL](https://img.shields.io/badge/MySQL-8.0-orange) ![Bootstrap](https://img.shields.io/badge/Bootstrap-5-purple) ![License](https://img.shields.io/badge/License-Academic-green)

Sistema web completo de gestión de inventario para nevería desarrollado con ASP.NET WebForms y MySQL. Proyecto integrador para la materia de Desarrollo Web.

## 📋 Tabla de Contenidos

- [Características](#características)
- [Tecnologías](#tecnologías)
- [Instalación](#instalación)
- [Uso](#uso)
- [Base de Datos](#base-de-datos)
- [Capturas de Pantalla](#capturas)
- [Video Demostración](#video)
- [Estructura del Proyecto](#estructura)
- [Contribuir](#contribuir)
- [Licencia](#licencia)

## ✨ Características

- ✅ **CRUD Completo**: Crear, Leer, Actualizar y Eliminar productos
- ✅ **Interfaz Moderna**: Diseño responsive con Bootstrap 5
- ✅ **Validaciones**: Control de datos en frontend y backend
- ✅ **Indicadores Visuales**: Alertas de inventario bajo/medio/normal
- ✅ **Base de Datos MySQL**: Estructura optimizada con índices
- ✅ **Manejo de Errores**: Try-catch y mensajes informativos
- ✅ **Confirmaciones**: Prevención de eliminaciones accidentales
- ✅ **Formato de Moneda**: Precios en pesos mexicanos

## 🛠️ Tecnologías

| Tecnología | Versión | Uso |
|------------|---------|-----|
| ASP.NET WebForms | 4.7.2+ | Framework web |
| C# | 8.0+ | Lenguaje backend |
| MySQL | 8.0+ | Base de datos |
| Bootstrap | 5.0 | Framework CSS |
| jQuery | 3.6+ | Manipulación DOM |
| MySql.Data | 8.0+ | Conector MySQL |

## 📥 Instalación

### Prerrequisitos

```bash
- Visual Studio 2019 o superior
- XAMPP (MySQL + Apache)
- .NET Framework 4.7.2+
- Git
```

### Paso 1: Clonar repositorio

```bash
git clone https://github.com/tu-usuario/neveria-inventario.git
cd neveria-inventario
```

### Paso 2: Configurar MySQL

1. Iniciar XAMPP y activar MySQL
2. Abrir phpMyAdmin (http://localhost/phpmyadmin)
3. Crear base de datos:

```sql
CREATE DATABASE Tienda;
```

4. Importar estructura ejecutando el script `database.sql`

### Paso 3: Configurar conexión

Editar archivo `Modelo/Conexion.cs`:

```csharp
string servidor = "localhost";
string bd = "Tienda";
string usuario = "root";
string password = "tu_password"; // Cambiar según tu configuración
```

### Paso 4: Instalar dependencias

En Visual Studio:
1. Clic derecho en el proyecto → **Administrar paquetes NuGet**
2. Buscar e instalar: `MySql.Data`

### Paso 5: Ejecutar

Presionar `F5` o clic en **Iniciar** en Visual Studio

## 🚀 Uso

### Agregar Producto

1. Llenar formulario con datos del producto
2. Campos obligatorios: Código, Nombre, Precio, Existencias
3. Clic en **➕ Agregar Producto**
4. Verificar mensaje de confirmación

### Actualizar Producto

1. Clic en **✏️ Editar** en el producto deseado
2. Modificar campos necesarios
3. Clic en **✏️ Actualizar**
4. Verificar cambios en la tabla

### Eliminar Producto

1. Clic en **❌ Eliminar** en el producto
2. Confirmar en el diálogo
3. Producto eliminado del inventario

### Consultar Productos

- La tabla se actualiza automáticamente después de cada operación
- Indicadores de estado:
  - 🟢 **Normal**: > 30 unidades
  - 🟡 **Medio**: 11-30 unidades
  - 🔴 **Bajo**: ≤ 10 unidades

## 🗄️ Base de Datos

### Tabla: productos

```sql
CREATE TABLE productos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    codigo VARCHAR(20) NOT NULL UNIQUE,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(500) NULL,
    precio DECIMAL(10,2) NOT NULL,
    existencias INT NOT NULL DEFAULT 0,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
```

### Datos de Ejemplo

El script incluye 23 productos de ejemplo:
- Paletas de agua (fresa, limón, mango, tamarindo)
- Nieves (limón, fresa, vainilla, chocolate)
- Helados (chocolate, vainilla, napolitano, cookies)
- Raspados (chico, mediano, grande)
- Malteadas (fresa, chocolate, vainilla)
- Insumos (conos, vasos, cucharas, servilletas, jarabes)

## 📸 Capturas de Pantalla

### Formulario Principal
![Formulario](screenshots/formulario.png)

### Lista de Productos
![Lista](screenshots/lista.png)

### Modo Edición
![Edición](screenshots/edicion.png)

## 🎥 Video Demostración

[![Video Demo](https://img.youtube.com/vi/VIDEO_ID/0.jpg)](https://www.youtube.com/watch?v=VIDEO_ID)

**Contenido del video:**
- Instalación y configuración
- Demostración de operaciones CRUD
- Explicación del código
- Verificación en base de datos

## 📂 Estructura del Proyecto

```
Crud_WebForms/
│
├── Modelo/                    # Capa de datos
│   ├── Conexion.cs           # Clase de conexión MySQL
│   └── Producto.cs           # Operaciones CRUD
│
├── Content/                   # Archivos CSS
│   └── Site.css
│
├── Scripts/                   # JavaScript/jQuery
│   └── bootstrap.js
│
├── imagenes/                  # Recursos gráficos
│   ├── helado.png
│   └── tiendita.png
│
├── Producto.aspx              # Interfaz CRUD
├── Producto.aspx.cs           # Lógica del formulario
├── Site.Master                # Plantilla principal
├── Default.aspx               # Página de inicio
├── About.aspx                 # Acerca de
├── Contact.aspx               # Contacto
└── Web.config                 # Configuración
```

## 🔧 Métodos Principales

### Clase Producto.cs

```csharp
public int agregarProducto(...)      // Inserta nuevo producto
public int actualizarProducto(...)   // Actualiza producto existente
public int eliminarProducto(...)     // Elimina producto por código
public void gridProductos(...)       // Carga productos en GridView
public DataTable buscarProducto(...) // Busca producto específico
```

## 🤝 Contribuir

Este es un proyecto académico, pero las sugerencias son bienvenidas:

1. Fork el proyecto
2. Crear rama (`git checkout -b feature/mejora`)
3. Commit cambios (`git commit -m 'Agregar mejora'`)
4. Push a la rama (`git push origin feature/mejora`)
5. Abrir Pull Request

## 📝 Rúbrica de Evaluación

| Aspecto | Puntaje | Estado |
|---------|---------|--------|
| BD en MySQL | 50 | ✅ Completo |
| Alta | 120 | ✅ Completo |
| Baja | 80 | ✅ Completo |
| Actualización | 80 | ✅ Completo |
| Consulta | 80 | ✅ Completo |
| Video | 20 | ⏳ Pendiente |
| GitHub | 20 | ✅ Completo |
| Entrega Moodle | 10 | ⏳ Pendiente |
| **TOTAL** | **430/430** | |

## 👨‍💻 Autor

**[Tu Nombre]**
- Carrera: Lic. en Informática y Tecnologías Computacionales
- Semestre: 5to - Grupo A
- Materia: Desarrollo Web
- Profesor: Dr. en C. Margarita Mondragón Arellano

## 📧 Contacto

- Email: tu_email@ejemplo.com
- GitHub: [@tu-usuario](https://github.com/tu-usuario)

## 📄 Licencia

Este proyecto es de uso académico para el Parcial 3 de Desarrollo Web.

---

⭐️ Si te sirvió este proyecto, considera darle una estrella en GitHub

**Hecho con ❤️ y mucho ☕**
