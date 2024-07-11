using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Huellitas_ptc
{
    public partial class AgregarProducto1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            string strFileName;
            string strFilePath;
            string strFolder;

            strFolder = Server.MapPath("./images/");

            if (foto.HasFile)
            {
                strFileName = foto.PostedFile.FileName;
                strFileName = Path.GetFileName(strFileName);

                if (!Directory.Exists(strFolder))
                {
                    Directory.CreateDirectory(strFolder);
                }
                // Save the uploaded file to the server.
                strFilePath = strFolder + strFileName;
                if (!File.Exists(strFilePath))
                {
                    foto.PostedFile.SaveAs(strFilePath);
                }
                string product = nombre.Text.Trim();
                double price = Convert.ToDouble(precio.Text.Trim());
                int qty = Convert.ToInt32(Textbox2.Text.Trim());
                string image = strFileName;
                int guardado = conexiones.Add_Product(product, price, qty, image);

                if (guardado == 1)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Registro guardado exitosamente');", true);

                }
                else
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Hubo un error al guardar los datos');", true);

            }
        }
    }
}