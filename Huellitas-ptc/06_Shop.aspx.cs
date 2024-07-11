using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Huellitas_ptc
{
    public partial class _06_Shop : System.Web.UI.Page
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
                                    "<img src='productos/" + row["Imagen"] + "' class='card-img-top'/>" +
                                    "<div class='card-body'> " +
                                        "<h5 class='card-title'>" + row["nombre"] + " </h5>" +
                                        "<p class='card-text'>Marca: <strong>" + row["Marca"] + "</strong> Precio: <strong>" + row["Precio"] + " </strong></p>" +
                                        "<a href='addtocart.aspx?itemId=" + row["Cantidad"] + "' class='btn btn-primary'>Adoptar</a>" +
                                    "</div>" +
                                "</div>" +
                            "</div>";
            }

            ProductsLiteral.Text = template;
        }
    }
}