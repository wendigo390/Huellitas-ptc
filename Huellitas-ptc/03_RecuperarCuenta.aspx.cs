using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Huellitas_ptc
{
    public partial class _03_RecuperarCuenta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void submit_Click1(object sender, EventArgs e)
        {
            if (txtusuario.Text != "")
            {
                try
                {
                    string userforgot = txtusuario.Text;
                    ValorGlobalOlvidoContra.ValorGlobal = userforgot;
                    // Genera un número aleatorio de 6 dígitos
                    Random rand = new Random();
                    string randomCode = rand.Next(999999).ToString();
                    string eventorandom = randomCode + "reset_randomcode";

                    // Conexión para la inserción del token en la base de datos
                    MySqlConnection conexion2 = new MySqlConnection("Server = 127.0.0.1; database = ptc; Uid = root; pwd = Info2024/*-;");
                    conexion2.Open();

                    MySqlCommand comando = new MySqlCommand(String.Format("UPDATE usuarios SET Token = '{0}' WHERE Nombre_Usuario = '{1}'", randomCode, txtusuario.Text), conexion2);
                    MySqlCommand evento = new MySqlCommand("CREATE EVENT eventonombre ON SCHEDULE AT CURRENT_TIMESTAMP + INTERVAL 2 MINUTE DO UPDATE usuarios SET Token = NULL", conexion2);
                    comando.ExecuteNonQuery();
                    evento.ExecuteNonQuery();
                    conexion2.Close();





                    string user = txtusuario.Text;
                    MySqlConnection conexion = new MySqlConnection("Server=127.0.0.1; database=ptc; Uid=root; pwd=Info2024/*-;");
                    var cmd = "Select Password from usuarios where Nombre_Usuario='" + user + "';";
                    var cmd1 = "Select Correo from usuarios where Nombre_Usuario ='" + user + "';";
                    var cmd2 = "Select Nombre from usuarios where Nombre_Usuario ='" + user + "';";

                    MySqlCommand obtenerContra = new MySqlCommand(cmd, conexion);
                    obtenerContra.Parameters.Add("@Name", MySqlDbType.VarChar);
                    MySqlCommand obtenerCorreo = new MySqlCommand(cmd1, conexion);
                    obtenerCorreo.Parameters.Add("@Name", MySqlDbType.VarChar);
                    MySqlCommand obtenerNombre = new MySqlCommand(cmd2, conexion);

                    string mail;
                    string contra;
                    string nombrecliente;
                    string contraDesencriptada;
                    conexion.Open();
                    mail = (string)obtenerCorreo.ExecuteScalar();
                    contra = (string)obtenerContra.ExecuteScalar();
                    nombrecliente = (string)obtenerNombre.ExecuteScalar();
                    contraDesencriptada = DecryptString(contra, initVector);

                    string correo = mail;// cambiar por correo del usuario que realiza la compra
                    string nombre = "";

                    var fromAddress = new MailAddress("huellitas.adopt@gmail.com", "Huellitas");
                    const string fromPassword = "ggggciozoagnyxxn   ";
                    var toAddress = new MailAddress(correo, nombre);//Dirección de correo y nombre que se muestra				
                    const string subject = "Recuperar contraseña";//Asunto del correo
                    string body = "Estimado " + nombrecliente + ", gracias por preferirnos y confiar en nosotros. Es un placer para nosotros que sea nuestro cliente, y no queremos que sufra inconvenientes. En el presente correo le enviamos la contraseña que solicitó. Muchas gracias por ser nuestro cliente. su token acontinuacion: " + randomCode + "";
                    //Fin de datos del envío

                    var smtp = new SmtpClient
                    {
                        Host = "smtp.gmail.com",
                        Port = 587,
                        EnableSsl = true,
                        DeliveryMethod = SmtpDeliveryMethod.Network,
                        UseDefaultCredentials = false,
                        Credentials = new NetworkCredential(fromAddress.Address, fromPassword)
                    };
                    using (var message = new MailMessage(fromAddress, toAddress)
                    {
                        Subject = subject,
                        Body = body
                    })
                    {
                        smtp.Send(message);//Enviar el correo
                    }
                    alerta.Text = "<script>Swal.fire('Correo enviado con éxito', 'Contraseña recuperada', 'success');</script>";
                    Response.AddHeader("REFRESH", "3;URL=Token.aspx");
                }
                catch
                {
                    alerta.Text = "<script>Swal.fire('Algo salió mal', 'Revisa tu usuario.', 'error');</script>";
                }
            }
            else
            {
                alerta.Text = "<script>Swal.fire('Error', 'No deje espacios en blanco.', 'error');</script>";
            }


        }
        private const string initVector = "huellitasptc2024";
        // This constant is used to determine the keysize of the encryption algorithm
        private const int keysize = 256;




        public static string DecryptString(string cipherText, string passPhrase)
        {
            byte[] initVectorBytes = Encoding.UTF8.GetBytes(initVector);
            byte[] cipherTextBytes = Convert.FromBase64String(cipherText);
            PasswordDeriveBytes password = new PasswordDeriveBytes(passPhrase, null);
            byte[] keyBytes = password.GetBytes(keysize / 8);
            RijndaelManaged symmetricKey = new RijndaelManaged();
            symmetricKey.Mode = CipherMode.CBC;
            ICryptoTransform decryptor = symmetricKey.CreateDecryptor(keyBytes, initVectorBytes);
            MemoryStream memoryStream = new MemoryStream(cipherTextBytes);
            CryptoStream cryptoStream = new CryptoStream(memoryStream, decryptor, CryptoStreamMode.Read);
            byte[] plainTextBytes = new byte[cipherTextBytes.Length];
            int decryptedByteCount = cryptoStream.Read(plainTextBytes, 0, plainTextBytes.Length);
            memoryStream.Close();
            cryptoStream.Close();
            return Encoding.UTF8.GetString(plainTextBytes, 0, decryptedByteCount);
        }


    }
}
