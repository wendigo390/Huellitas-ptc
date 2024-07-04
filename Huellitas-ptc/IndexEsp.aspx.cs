﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Huellitas_ptc
{
    public partial class IndexEsp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuario"] == null)
            {
                Session.Abandon();
            }

        }
        protected void Loginbutton(object sender, EventArgs e)
        {
            Response.Redirect("02_LoginEsp.aspx");
        }

        protected void Logoutbutton(object sender, EventArgs e)
        {
            Session["usuario"] = null;
            Session.Remove("usuario");
            Response.Redirect("02_LoginEsp.aspx");

        }
        protected void Gender_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

    }
}