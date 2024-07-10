﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Huellitas_ptc
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {




            if (Session["usuario"] == null)
            {
                Session.Abandon();
            }
            cargarCarrusell();



        }
        protected void Gender_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Loginbutton(object sender, EventArgs e)
        {
            Response.Redirect("02_Login.aspx");
        }

        protected void Logoutbutton(object sender, EventArgs e)
        {
            Session["usuario"] = null;
            Session.Remove("usuario");
            Response.Redirect("02_Login.aspx");

        }
        protected void cargarCarrusell()
        {
            string[] datos = conexiones.ObtenerImagenes();
            IndicatorsLiteral.Text = datos[1];
            ImagesLiteral.Text = datos[0];
        }
    }
}