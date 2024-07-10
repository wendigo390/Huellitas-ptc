﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Huellitas_ptc
{
    public partial class AgregarImagen : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            string strFileName;
            string strFilePath;
            string strFolder;

            strFolder = Server.MapPath("./images/");
            // Retrieve the name of the file that is posted.
            if (PhotoFile.HasFile)
            {
                strFileName = PhotoFile.PostedFile.FileName;
                strFileName = Path.GetFileName(strFileName);


                if (!Directory.Exists(strFolder))
                {
                    Directory.CreateDirectory(strFolder);
                }

                // Save the uploaded file to the server.
                strFilePath = strFolder + strFileName;
                if (!File.Exists(strFilePath))
                {
                    PhotoFile.PostedFile.SaveAs(strFilePath);
                }


                string foto = strFileName;
                int guardado = 0;
                try
                {
                    guardado = conexiones.AgregarImagen(foto);
                }
                catch (Exception exc)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "console.log('" + exc.Message + "');", true);
                }

                if (guardado == 1)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "Swal.fire('Su Imagen se agregó con éxito.', '', 'success');", true);
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "Swal.fire('Hubo un error al guardar la imagen', '', 'error');", true);
                }

            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "Swal.fire('Debe seleccionar una imagen', 'No se ha realizado la operación', 'error');", true);
            }
        }
    }
}