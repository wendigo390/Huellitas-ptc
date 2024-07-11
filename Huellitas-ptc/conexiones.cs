using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace Huellitas_ptc
{
    public class conexiones
    {
        public static MySqlConnection conexion = new MySqlConnection("Server= 127.0.0.1; database=ptc; Uid=root; pwd=Info2025/*-;");

        //**************************** Método para verificar si se repiten los usuario ****************************
        public static int UsuariosRepetidos(string usuario, string contra, string nombre, string apellido, string correo)
        {
            int valor = 0;
            MySqlConnection conexion = datos.ObtenerConexion();

            // Crear el comando SQL con parámetros para evitar inyecciones SQL
            string query = "SELECT COUNT(Id_Usuario) FROM usuarios WHERE LOWER(Nombre_Usuario) = LOWER(@usuario) OR LOWER(Correo) = LOWER(@correo)";
            MySqlCommand cmd = new MySqlCommand(query, conexion);
            cmd.Parameters.AddWithValue("@usuario", usuario);
            cmd.Parameters.AddWithValue("@correo", correo);

            // Ejecutar el comando y obtener el resultado
            valor = Convert.ToInt32(cmd.ExecuteScalar());

            // Verificar si hay coincidencias
            if (valor != 0)
            {
                // Aquí puedes manejar el caso de usuario o correo ya existente
                // Por ejemplo, podrías lanzar una excepción o devolver un código de error específico
                Console.WriteLine("El usuario o correo ya están registrados.");
            }
            else
            {
                // Si no hay coincidencias, agregar el nuevo usuario
                conexiones.AgregarUsuario(nombre, apellido, usuario, contra, correo);
            }

            // Cerrar la conexión
            conexion.Close();
            return valor;
        }




        //**************************** Método para los usuario ****************************
        public static int AgregarUsuario(string nombre, string apellido, string usuario, string contra, string correo)
        {
            int retorno = 0;
            MySqlCommand comando = new MySqlCommand(string.Format("Insert  into  usuarios  (Nombre,  Apellido,  Nombre_Usuario,  Password, Correo,  IdRol)  values  ('{0}','{1}','{2}','{3}','{4}','2')", nombre, apellido, usuario, contra, correo), datos.ObtenerConexion());
            retorno = comando.ExecuteNonQuery();

            return retorno;
        }

        //**************************** Método para agregar imagen ****************************
        public static int AgregarImagen(string foto)
        {
            MySqlConnection conn = datos.ObtenerConexion();
            int retorno = 0;
            MySqlCommand comando = new MySqlCommand(string.Format("INSERT INTO imagenes_carrusel (Direccion) VALUES('{0}'); ", foto), conn);

            retorno = comando.ExecuteNonQuery();
            return retorno;
        }

        //**************************** Método para obtener las imágenes ****************************
        public static string[] ObtenerImagenes()
        {
            MySqlConnection conn = datos.ObtenerConexion();
            MySqlDataAdapter DA = new MySqlDataAdapter();
            DA.SelectCommand = new MySqlCommand(string.Format("SELECT * from imagenes_carrusel;"), conn);
            DataTable table = new DataTable();
            DA.Fill(table);
            string imagenes = "";
            string indicators = "";
            int contador = 0;
            foreach (DataRow row in table.Rows)
            {
                if (row["ID"].ToString() == "1")
                {
                    imagenes = imagenes + "<div class='carousel-item active'><img src='images/" + row["Direccion"] + "'width = '1100' height = '500'/><div class='carousel-caption d-none d-md-block'><h5>" + row["Texto"] + "</h5></div></div>";

                }
                else
                {
                    imagenes = imagenes + "<div class='carousel-item'><img src='images/" + row["Direccion"] + "'width='1100'height='500'/><div class='carousel-caption d-none d-md-block'><h5>" + row["Texto"] + "</h5></div></div>";

                }
                if (contador == 0)
                {
                    indicators = indicators + "<li data-target='#demo' data-slide-to='" + contador.ToString() + "'class='active'></li>";
                }
                else
                {
                    indicators = indicators + "<li data-target='#demo' data-slide-to='" + contador.ToString() + "'></li>";
                }
                contador = contador + 1;
            }
            string[] retorno = new string[2];
            retorno[0] = imagenes;
            retorno[1] = indicators;
            return retorno;
        }

        //**************************************METODO PARA INGRESAR TUS MASCOTAS****************************************

        public static int Add_pets(string nombre, string edad, string peso, string imagen, string raza, string descripcion)
        {
            MySqlConnection conexion = datos.ObtenerConexion();
            int retorno = 0;
            MySqlCommand comando = new MySqlCommand("INSERT INTO mascota (nombre, edad, peso, imagen, raza, descripcion) VALUES (@nombre, @edad, @peso, @imagen, @raza, @descripcion);", conexion);
            comando.Parameters.AddWithValue("@nombre", nombre);
            comando.Parameters.AddWithValue("@edad", edad);
            comando.Parameters.AddWithValue("@peso", peso);
            comando.Parameters.AddWithValue("@imagen", imagen);
            comando.Parameters.AddWithValue("@raza", raza);
            comando.Parameters.AddWithValue("@descripcion", descripcion);



            comando.Prepare();
            retorno = comando.ExecuteNonQuery();
            conexion.Close();
            return retorno;
        }
        //**********************************************Mostrar Mascotas******************************************************
        public static DataTable Fetch_Products(bool imgElement)
        {
            MySqlConnection conexion = datos.ObtenerConexion();
            MySqlDataAdapter DA = new MySqlDataAdapter();
            MySqlCommand cmd = new MySqlCommand("SELECT * FROM mascota;", conexion);
            DA.SelectCommand = cmd;
            DataTable DT = new DataTable();

            DA.Fill(DT);

            if (imgElement)
            {
                foreach (DataRow row in DT.Rows)
                {
                    row["imagen"] = "<img width='100px' class='thumbnail' src='./mascotas/" + row["imagen"] + "' />";
                }
            }
            conexion.Close();
            return DT;
        }
        //******************************************** Metodo Productos*************************************************************
        public static int Add_Product(string product, double price, int quantity, string image)
        {
            MySqlConnection conexion = datos.ObtenerConexion();
            int retorno = 0;
            MySqlCommand comando = new MySqlCommand("INSERT INTO productos (Name, Price, Quantity, Image) VALUES (@product, @price, @quantity, @image);", conexion);
            comando.Parameters.AddWithValue("@product", product);
            comando.Parameters.AddWithValue("@price", price);
            comando.Parameters.AddWithValue("@quantity", quantity);
            comando.Parameters.AddWithValue("@image", image);

            comando.Prepare();
            retorno = comando.ExecuteNonQuery();
            conexion.Close();
            return retorno;
        }
    }
}
