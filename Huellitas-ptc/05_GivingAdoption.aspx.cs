using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Huellitas_ptc
{
    public partial class _05_GivingAdoption : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Gender_SelectedIndexChanged(object sender, EventArgs e)
        {
            Response.Redirect("05_GivingAdoptionEsp.aspx");
        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            string strFileName;
            string strFilePath;
            string strFolder;

            strFolder = Server.MapPath("./mascotas/");

            if (foTo.HasFile)
            {
                strFileName = foTo.PostedFile.FileName;
                strFileName = Path.GetFileName(strFileName);

                if (!Directory.Exists(strFolder))
                {
                    Directory.CreateDirectory(strFolder);
                }
                // Save the uploaded file to the server.
                strFilePath = strFolder + strFileName;
                if (!File.Exists(strFilePath))
                {
                    foTo.PostedFile.SaveAs(strFilePath);
                }
                string nombre = noMbre.Text.Trim();
                string edad = eDad.Text.Trim();
                string peso = peSo.Text.Trim();
                string image = strFileName;
                string raza = raZa.Text.Trim();
                string descripcion = comentarios.Text.Trim();
                int guardado = conexiones.Add_pets(nombre, edad, peso, image, raza, descripcion);

                if (guardado == 1)
                {
                    alerta.Text = "<script>swal('Éxito', 'Su mascota fue agregada', 'success').then(function() {window.location.href = '';});</script>";

                }
                else
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Hubo un error al guardar los datos');", true);

            }
        }
        protected void foTo_TextChanged(object sender, EventArgs e)
        {

        }
    }
}