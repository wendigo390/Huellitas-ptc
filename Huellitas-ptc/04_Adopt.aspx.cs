using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Huellitas_ptc
{
    public partial class _04_Adopt : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Load_Products();

        }
        protected void Gender_SelectedIndexChanged(object sender, EventArgs e)
        {
            Response.Redirect("04_AdoptEsp.aspx");
        }

        protected void Load_Products()
        {

            string template = "";

            DataTable products = conexiones.Fetch_Products(false);

            foreach (DataRow row in products.Rows)
            {
                template += "<div class='col-sm-12 col-md-3 col-lg-3'> " +
                                "<div class='card'> " +
                                    "<img src='mascotas/" + row["imagen"] + "' class='card-img-top'/>" +
                                    "<div class='card-body'> " +
                                        "<h5 class='card-title'>" + row["nombre"] + " </h5>" +
                                        "<p class='card-text'>Raza: <strong>" + row["raza"] + "</strong> Edad: <strong>" + row["edad"] + " </strong></p>" +
                                        "<a href='addtocart.aspx?itemId=" + row["peso"] + "' class='btn btn-primary'>Adoptar</a>" +
                                    "</div>" +
                                "</div>" +
                            "</div>";
            }

            ProductsLiteral.Text = template;
        }
    }
}