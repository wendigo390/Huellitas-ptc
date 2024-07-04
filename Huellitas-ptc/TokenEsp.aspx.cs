using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Huellitas_ptc
{
    public partial class TokenEsp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void submit_Click1(object sender, EventArgs e)
        {
            if (txttoken.Text.Trim() != "")
            {
                string tokenusu = txttoken.Text; //Valor del TextBox
                MySqlConnection connection = datos.ObtenerConexion();
                var cmd = "SELECT Id_Usuario from usuarios WHERE Token='" + tokenusu + "';"; //Comparando el Token asignado al usuario
                MySqlCommand comando = new MySqlCommand(cmd, connection);
                //conexion.Open();
                int retorno = Convert.ToInt32(comando.ExecuteScalar());
                if (retorno != 0)
                {
                    alerta.Text = "<script>Swal.fire('Verification code correct!', '', 'success') </script>";
                    Response.AddHeader("REFRESH", "3;URL=FormularioCambioPasswordEsp.aspx"); //Nos redirecciona al formulario para actualizar contraseñas
                    txttoken.Text = "";
                }
                else
                {
                    alerta.Text = "<script>Swal.fire('Incorrect Code!', 'The code does not match, please check the email again', 'error') </script>";
                    txttoken.Text = "";
                }
            }
            else
            {
                alerta.Text = "<script>Swal.fire('OOPS!', 'Do not leave empty spaces', 'warning') </script>";
                txttoken.Text = "";
            }
        }
    }
}