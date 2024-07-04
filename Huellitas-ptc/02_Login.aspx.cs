﻿using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Huellitas_ptc
{
    public partial class _02_Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["usuario"] != null)
            {
                Session.Abandon();
            }
        }

        public static String sha256_hash(String value)
        {
            StringBuilder Sb = new StringBuilder();

            using (SHA256 hash = SHA256Managed.Create())
            {
                Encoding enc = Encoding.UTF8;
                Byte[] result = hash.ComputeHash(enc.GetBytes(value));

                foreach (Byte b in result)
                    Sb.Append(b.ToString("x2"));
            }

            return Sb.ToString();
        }

        protected void Button_Login(object sender, EventArgs e)
        {
            string username = txtusuario.Text;
            string password = sha256_hash(txtclave.Text);
            string email = txtusuario.Text;

            MySqlConnection conexion = new MySqlConnection("Server=127.0.0.1; database=ptc; Uid=root; pwd=Info2024/*-;");
            MySqlCommand cmd = new MySqlCommand("SELECT Nombre_Usuario, IdRol FROM usuarios WHERE (Nombre_Usuario = @username OR Correo = @email) AND Password = @password", conexion);
            cmd.Parameters.AddWithValue("@username", username);
            cmd.Parameters.AddWithValue("@password", password);
            cmd.Parameters.AddWithValue("@email", email);

            conexion.Open();
            MySqlDataReader reader = cmd.ExecuteReader();

            if (reader.Read())
            {
                string nombreUsuario = reader["Nombre_Usuario"].ToString();
                int idRol = Convert.ToInt32(reader["IdRol"]);

                Session["usuario"] = nombreUsuario; // Asigna el nombre de usuario a la variable de sesión

                if (idRol == 3) /*Superadmin*/
                {
                    alerta.Text = "<script>swal('Success', 'Welcome SuperAdmin', 'success').then(function() {window.location.href = 'SuperAdmin.aspx';});</script>";
                }
                else
                {
                    if (idRol == 1) // Administrador
                    {
                        alerta.Text = "<script>swal('Success', 'Welcome Administrator', 'success').then(function() {window.location.href = 'Admin_01.aspx';});</script>";
                    }
                    else // Usuario
                    {
                        alerta.Text = "<script>swal('Success', 'Logged In', 'success').then(function() {window.location.href = 'Index.aspx';});</script>";
                    }
                }

            }
            else
            {
                alerta.Text = "<script>Swal.fire('Algo salio mal', 'Su usuario o contraseña no son correctos', 'error') </script>";
                txtclave.Text = "";
                txtusuario.Text = "";
            }
        }

        private const string initVector = "huellitasptc2024";
        // This constant is used to determine the keysize of the encryption algorithm
        private const int keysize = 256;
        //Encrypt
        public static string EncryptString(string plainText, string passPhrase)
        {
            byte[] initVectorBytes = Encoding.UTF8.GetBytes(initVector);
            byte[] plainTextBytes = Encoding.UTF8.GetBytes(plainText);
            PasswordDeriveBytes password = new PasswordDeriveBytes(passPhrase, null);
            byte[] keyBytes = password.GetBytes(keysize / 8);
            RijndaelManaged symmetricKey = new RijndaelManaged();
            symmetricKey.Mode = CipherMode.CBC;
            ICryptoTransform encryptor = symmetricKey.CreateEncryptor(keyBytes, initVectorBytes);
            MemoryStream memoryStream = new MemoryStream();
            CryptoStream cryptoStream = new CryptoStream(memoryStream, encryptor, CryptoStreamMode.Write);
            cryptoStream.Write(plainTextBytes, 0, plainTextBytes.Length);
            cryptoStream.FlushFinalBlock();
            byte[] cipherTextBytes = memoryStream.ToArray();
            memoryStream.Close();
            cryptoStream.Close();
            return Convert.ToBase64String(cipherTextBytes);

            //OCUPAR RIJNDAEL-256 BITS
        }
    }
}