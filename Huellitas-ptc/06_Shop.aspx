<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="06_Shop.aspx.cs" Inherits="Huellitas_ptc._06_Shop" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Pet Sitting - Free Bootstrap 4 Template by Colorlib</title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>

    <link href="https://fonts.googleapis.com/css?family=Montserrat:200,300,400,500,600,700,800&display=swap" rel="stylesheet"/>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>

    <link rel="stylesheet" href="css/animate.css"/>

    <link rel="stylesheet" href="css/owl.carousel.min.css"/>
    <link rel="stylesheet" href="css/owl.theme.default.min.css"/>
    <link rel="stylesheet" href="css/magnific-popup.css"/>


    <link rel="stylesheet" href="css/bootstrap-datepicker.css"/>
    <link rel="stylesheet" href="css/jquery.timepicker.css"/>

    <link rel="stylesheet" href="css/flaticon.css"/>
    <link rel="stylesheet" href="css/style.css"/>
</head>
<body>
    <form runat="server">

        <div class="wrap">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 d-flex align-items-center">
                        <p class="mb-0 phone pl-md-2">
                            <a href="#" class="mr-2"><span class="fa fa-phone mr-1"></span>+503 7053 1387</a>
                            <a href="#"><span class="fa fa-paper-plane mr-1"></span>huellitas.adopt@gmail.com</a>
                        </p>
                    </div>
                    <div class="col-md-6 d-flex justify-content-md-end">
                    </div>
                </div>
            </div>
        </div>
        <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
            <div class="container">
                <a class="navbar-brand" href="Index.aspx"><span class="flaticon-pawprint-1 mr-2"></span>Huellitas</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="fa fa-bars"></span>Menu
                </button>
                <div class="collapse navbar-collapse" id="ftco-nav">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item "><a href="Index.aspx" class="nav-link">Home</a></li>
                        <li class="nav-item active"><a href="04_Adopt.aspx" class="nav-link">Adopt</a></li>
                        <li class="nav-item"><a href="05_GivingAdoption.aspx" class="nav-link">Giving Adoption</a></li>
                        <li class="nav-item"><a href="06_Shop.aspx" class="nav-link">Shop</a></li>
                        <li class="nav-item"><a href="07_Team.aspx" class="nav-link">Team</a></li>
                        <li class="nav-item"><a href="08_Contact.aspx" class="nav-link">Contact</a></li>
                    </ul>


                    <div class="form-group">
                        <asp:DropDownList ID="Gender"
                            AutoPostBack="True"
                            runat="server" OnSelectedIndexChanged="Gender_SelectedIndexChanged">
                            <asp:ListItem Selected="True" Value="Select Gender">  English </asp:ListItem>
                            <asp:ListItem Value="Masculino"> Spanish </asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="form-group">&nbsp;</div>


                </div>
            </div>
        </nav>
        <!-- END nav -->
        <section class="hero-wrap hero-wrap-2" style="background-image: url('images/bg_2.jpg');" data-stellar-background-ratio="0.5">
            <div class="overlay"></div>
            <div class="container">
                <div class="row no-gutters slider-text align-items-end">
                    <div class="col-md-9 ftco-animate pb-5">
                        <p class="breadcrumbs mb-2"><span class="mr-2"><a href="Index.aspx">Home <i class="ion-ios-arrow-forward"></i></a></span><span>Adopt<i class="ion-ios-arrow-forward"></i></span></p>
                        <h1 class="mb-0 bread">Adopt a Pet</h1>
                    </div>
                </div>
            </div>
        </section>

        <section class="ftco-section bg-light">
<%-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ --%>
        <div class="container my-4">
            <div class="row">
                <asp:Literal id="ProductsLiteral" runat="server"></asp:Literal>
            </div>
        </div>
<%-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ --%>
        </section>

        <footer class="footer">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 col-lg-3 mb-4 mb-md-0">
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-3 mb-4 mb-md-0">
                <h2 class="footer-heading">Huellitas</h2>
                <div class="block-23 mb-3">
                    <ul>
                        <li><a href="#"><span class="icon fa fa-phone"></span><span class="text">+503 7053 1387</span></a></li>
                        <li><a href="#"><span class="icon fa fa-paper-plane"></span><span class="text">huellitas.adopt@gmail.com</span></a></li>
                    </ul>
                </div>
            </div>
            <div class="row mt-5">
                <div class="col-md-12 text-center">
                </div>
            </div>
        </footer>
        <!-- loader -->
        <div id="ftco-loader" class="show fullscreen">
            <svg class="circular" width="48px" height="48px">
                <circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee" />
                <circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" />
            </svg>
        </div>


        <script src="js/jquery.min.js"></script>
        <script src="js/jquery-migrate-3.0.1.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.easing.1.3.js"></script>
        <script src="js/jquery.waypoints.min.js"></script>
        <script src="js/jquery.stellar.min.js"></script>
        <script src="js/jquery.animateNumber.min.js"></script>
        <script src="js/bootstrap-datepicker.js"></script>
        <script src="js/jquery.timepicker.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/scrollax.min.js"></script>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
        <script src="js/google-map.js"></script>
        <script src="js/main.js"></script>


    </form>
</body>
</html>
