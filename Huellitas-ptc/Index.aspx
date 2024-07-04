﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Huellitas_ptc.Index" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title>Huellitas</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

    <link href="https://fonts.googleapis.com/css?family=Montserrat:200,300,400,500,600,700,800&display=swap" rel="stylesheet" />

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />

    <link rel="stylesheet" href="css/animate.css" />

    <link rel="stylesheet" href="css/owl.carousel.min.css" />
    <link rel="stylesheet" href="css/owl.theme.default.min.css" />
    <link rel="stylesheet" href="css/magnific-popup.css" />


    <link rel="stylesheet" href="css/bootstrap-datepicker.css" />
    <link rel="stylesheet" href="css/jquery.timepicker.css" />

    <link rel="stylesheet" href="css/flaticon.css" />
    <link rel="stylesheet" href="css/style.css" />

<%--    javascript para que el usuario se quite al regresar la pagina    --%>
    <script type="text/javascript">
        window.onpageshow = function (event) {
            if (event.persisted) {
                window.location.reload();
            }
        };
</script>
 <%--++++++++++++++++++++++++++++++++++++++++++++++++++++++++--%>
</head>
<body>
    <form runat="server">

<%--+++++++++++++ start nav ++++++++++++++++++++++++++++++++++++++++++++++++++++++--%>

        <div class="wrap">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 d-flex align-items-center">
                        <p class="mb-0 phone pl-md-2">
                            <a href="08_Contact.aspx" class="mr-2"><span class="fa fa-phone mr-1"></span>+503 7053 1387</a>
                            <a href="08_Contact.aspx"><span class="fa fa-paper-plane mr-1"></span>huellitas.adopt@gmail.com</a>
                        </p>

                    </div>
                    <div class="form-group">&nbsp;</div>
               <div style=" position:absolute; left: 1200px; right; 1200px;">

            <a href="01_Registro.aspx"> <img src="imagen1/mundo.png" /></a>
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
                        <li class="nav-item active"><a href="Index.aspx" class="nav-link">Home</a></li>
                        <li class="nav-item"><a href="04_Adopt.aspx" class="nav-link">Adopt</a></li>
                        <li class="nav-item"><a href="05_GivingAdoption.aspx" class="nav-link">Giving Adoption</a></li>
                        <li class="nav-item"><a href="06_Shop.aspx" class="nav-link">Shop</a></li>
                        <li class="nav-item"><a href="07_Team.aspx" class="nav-link">Team</a></li>
                        <li class="nav-item"><a href="08_Contact.aspx" class="nav-link">Contact</a></li>

                    </ul>
                    <div class="form-group">&nbsp;</div>
                    <div>
                        <ul class="navbar-nav align-items-center d-none d-md-flex">

                                    <li class="nav-item dropdown">
                                        <a class="nav-link pr-0" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <img src="1/usuario3.png" /><a /></a>
                                        <div class="media align-items-center">
                                            <div class="media-body ml-2 d-none d-lg-block">
                                            </div>
                                        </div>

<%--++++++++++++++++++++++++++ logica de usuario con y sin sesion iniciada ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--%>

                            <% if (Session["usuario"] != null && !string.IsNullOrEmpty((string)Session["usuario"])) { %>

                                        <div class="dropdown-menu dropdown-menu-arrow dropdown-menu-right">
                                            <div class=" dropdown-header noti-title">
                                                <h6 class="text-overflow m-0"></h6>
                                            </div>
                                            <a href="./examples/profile.html" class="dropdown-item">
                                                <i class="ni ni-single-02"></i>
                                                <span>My profile</span>
                                            </a>
                                            <a href="10_Index_Ajustes.aspx" class="dropdown-item">
                                                <i class="ni ni-settings-gear-65"></i>
                                                <span>Settings</span>
                                            </a>
                                            <div class="dropdown-divider"></div>
                                            <asp:Button ID="Logoutbtn" runat="server" Text="Logout" class="dropdown-item" OnClick="Logoutbutton" />
                                            <i class="ni ni-user-run"></i>
                                        </div>
                            <% } else {  %>

                                        <div class="dropdown-menu dropdown-menu-arrow dropdown-menu-right">
                                            <div class=" dropdown-header noti-title">
                                                <h6 class="text-overflow m-0"></h6>
                                            </div>
                                            <a href="10_Index_Ajustes.aspx" class="dropdown-item">
                                                <i class="ni ni-settings-gear-65"></i>
                                                <span>Settings</span>
                                            </a>
                                            <div class="dropdown-divider"></div>
                                            <asp:Button ID="Login" runat="server" Text="Login" class="dropdown-item" OnClick="Loginbutton" />
                                            <i class="ni ni-user-run"></i>
                                        </div>

                            <% } %>
                                    </li>
                            <%= Session["usuario"] %>
  <%--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--%>
                        </ul>
                    </div>
                </div>
            </div>
        </nav>
        
   <!--++++++++++++++++ END nav ++++++++++++++++++++++++++++++++++++++++++-->

        <style>
            /* Make the image fully responsive */
            .carousel-inner img {
                width: 104%;
                height: 100%;
            }
        </style>


        <div id="demo" class="carousel slide" data-ride="carousel" data-interval="3000" />

        <!-- Indicators -->
        <ul class="carousel-indicators">
            <asp:Literal ID="IndicatorsLiteral" Text="" runat="server"></asp:Literal>

        </ul>


        <!-- The slideshow -->

        <div class="carousel-inner">
            <asp:Literal ID="ImagesLiteral" Text="" runat="server"></asp:Literal>
            <div class="overlay"></div>
            <div class="container">
                <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center" data-scrollax-parent="true">
                    <div class="col-md-11 ftco-animate text-center">
                        <h1 class="mb-4">Highest Quality Care For Pets You'll Love </h1>

                    </div>
                </div>
            </div>
        </div>

        <section class="ftco-section bg-light ftco-no-pt ftco-intro">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 d-flex align-self-stretch px-4 ftco-animate">
                        <div class="d-block services active text-center">
                            <div class="icon d-flex align-items-center justify-content-center">
                                <span class="flaticon-blind"></span>
                            </div>
                            <div class="media-body">
                                <h3 class="heading">Adopt Animals</h3>
                                <p>You will be able to find your new best friend, encouraging the adoption and not the purchase of pets.</p>
                                <a href="04_Adopt.aspx" class="btn-custom d-flex align-items-center justify-content-center"><span class="fa fa-chevron-right"></span><i class="sr-only">Read more</i></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 d-flex align-self-stretch px-4 ftco-animate">
                        <div class="d-block services text-center">
                            <div class="icon d-flex align-items-center justify-content-center">
                                <span class="flaticon-dog-eating"></span>
                            </div>
                            <div class="media-body">
                                <h3 class="heading">Giving Adoption</h3>
                                <p>You can put your pet up for adoption, so it can find a loving home.</p>
                                <a href="05_GivingAdoption.aspx" class="btn-custom d-flex align-items-center justify-content-center"><span class="fa fa-chevron-right"></span><i class="sr-only">Read more</i></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 d-flex align-self-stretch px-4 ftco-animate">
                        <div class="d-block services text-center">
                            <div class="icon d-flex align-items-center justify-content-center">
                                <span class="flaticon-grooming"></span>
                            </div>
                            <div class="media-body">
                                <h3 class="heading">Shop</h3>
                                <p>You can find the best accessories for your pet, food and toys for your pet to enjoy.</p>
                                <a href="06_Shop.aspx" class="btn-custom d-flex align-items-center justify-content-center"><span class="fa fa-chevron-right"></span><i class="sr-only">Read more</i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <%--<section class="ftco-section ftco-no-pt ftco-no-pb">
    	<div class="container">
    		<div class="row d-flex no-gutters">
    			<div class="col-md-5 d-flex">
    				<div class="img img-video d-flex align-self-stretch align-items-center justify-content-center justify-content-md-center mb-4 mb-sm-0" style="background-image:url(images/about-1.jpg);">
    				</div>
    			</div>
    			<div class="col-md-7 pl-md-5 py-md-5">
    				<div class="heading-section pt-md-5">
	            <h2 class="mb-4">Why Choose Us?</h2>
    				</div>
    				<div class="row">
	    				<div class="col-md-6 services-2 w-100 d-flex">
	    					<div class="icon d-flex align-items-center justify-content-center"><span class="flaticon-stethoscope"></span></div>
	    					<div class="text pl-3">
	    						<h4>Care Advices</h4>
	    						<p></p>
	    					</div>
	    				</div>
	    				<div class="col-md-6 services-2 w-100 d-flex">
	    					<div class="icon d-flex align-items-center justify-content-center"><span class="flaticon-customer-service"></span></div>
	    					<div class="text pl-3">
	    						<h4>Customer Supports</h4>
	    						<p></p>
	    					</div>
	    				</div>
	    				<div class="col-md-6 services-2 w-100 d-flex">
	    					<div class="icon d-flex align-items-center justify-content-center"><span class="flaticon-emergency-call"></span></div>
	    					<div class="text pl-3">
	    						<h4>Emergency Services</h4>
	    						<p></p>
	    					</div>
	    				</div>
	    				<div class="col-md-6 services-2 w-100 d-flex">
	    					<div class="icon d-flex align-items-center justify-content-center"><span class="flaticon-veterinarian"></span></div>
	    					<div class="text pl-3">
	    						<h4>Health data</h4>
	    						<p></p>
	    					</div>
	    				</div>
	    			</div>
	        </div>
        </div>
    	</div>
    </section>--%>

        <%--<section class="ftco-counter" id="section-counter">
    	<div class="container">
				<div class="row">
          <div class="col-md-6 col-lg-3 d-flex justify-content-center counter-wrap ftco-animate">
            <div class="block-18 text-center">
              <div class="text">
                <strong class="number" data-number="50">0</strong>
              </div>
              <div class="text">
              	<span>Customer</span>
              </div>
            </div>
          </div>
          <div class="col-md-6 col-lg-3 d-flex justify-content-center counter-wrap ftco-animate">
            <div class="block-18 text-center">
              <div class="text">
                <strong class="number" data-number="8500">0</strong>
              </div>
              <div class="text">
              	<span>Professionals</span>
              </div>
            </div>
          </div>
          <div class="col-md-6 col-lg-3 d-flex justify-content-center counter-wrap ftco-animate">
            <div class="block-18 text-center">
              <div class="text">
                <strong class="number" data-number="20">0</strong>
              </div>
              <div class="text">
              	<span>Products</span>
              </div>
            </div>
          </div>
          <div class="col-md-6 col-lg-3 d-flex justify-content-center counter-wrap ftco-animate">
            <div class="block-18 text-center">
              <div class="text">
                <strong class="number" data-number="50">0</strong>
              </div>
              <div class="text">
              	<span>Pets Hosted</span>
              </div>
            </div>
          </div>
        </div>
    	</div>
    </section>--%>

        <%--<section class="ftco-section bg-light ftco-faqs">
    	<div class="container">
    		<div class="row">
    			<div class="col-lg-6 order-md-last">
    				<div class="img img-video d-flex align-self-stretch align-items-center justify-content-center justify-content-md-center mb-4 mb-sm-0" style="background-image:url(images/about.jpg);">
    					<a href="https://vimeo.com/45830194" class="icon-video popup-vimeo d-flex justify-content-center align-items-center">
    						<span class="fa fa-play"></span>
    					</a>
    				</div>
    				<div class="d-flex mt-3">
    					<div class="img img-2 mr-md-2" style="background-image:url(images/about-2.jpg);"></div>
    					<div class="img img-2 ml-md-2" style="background-image:url(images/about-3.jpg);"></div>
    				</div>
    			</div>

    			<div class="col-lg-6">
    				<div class="heading-section mb-5 mt-5 mt-lg-0">
	            <h2 class="mb-3">Frequently Asks Questions</h2>
	            <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
    				</div>
    				<div id="accordion" class="myaccordion w-100" aria-multiselectable="true">
						  <div class="card">
						    <div class="card-header p-0" id="headingOne">
						      <h2 class="mb-0">
						        <button href="#collapseOne" class="d-flex py-3 px-4 align-items-center justify-content-between btn btn-link" data-parent="#accordion" data-toggle="collapse" aria-expanded="true" aria-controls="collapseOne">
						        	<p class="mb-0">How to train your pet dog?</p>
						          <i class="fa" aria-hidden="true"></i>
						        </button>
						      </h2>
						    </div>
						    <div class="collapse show" id="collapseOne" role="tabpanel" aria-labelledby="headingOne">
						      <div class="card-body py-3 px-0">
						      	<ol>
						      		<li>Far far away, behind the word mountains</li>
						      		<li>Consonantia, there live the blind texts</li>
						      		<li>When she reached the first hills of the Italic Mountains</li>
						      		<li>Bookmarksgrove, the headline of Alphabet Village</li>
						      		<li>Separated they live in Bookmarksgrove right</li>
						      	</ol>
						      </div>
						    </div>
						  </div>

						  <div class="card">
						    <div class="card-header p-0" id="headingTwo" role="tab">
						      <h2 class="mb-0">
						        <button href="#collapseTwo" class="d-flex py-3 px-4 align-items-center justify-content-between btn btn-link" data-parent="#accordion" data-toggle="collapse" aria-expanded="false" aria-controls="collapseTwo">
						        	<p class="mb-0">How to manage your pets?</p>
						          <i class="fa" aria-hidden="true"></i>
						        </button>
						      </h2>
						    </div>
						    <div class="collapse" id="collapseTwo" role="tabpanel" aria-labelledby="headingTwo">
						      <div class="card-body py-3 px-0">
						      	<ol>
						      		<li>Far far away, behind the word mountains</li>
						      		<li>Consonantia, there live the blind texts</li>
						      		<li>When she reached the first hills of the Italic Mountains</li>
						      		<li>Bookmarksgrove, the headline of Alphabet Village</li>
						      		<li>Separated they live in Bookmarksgrove right</li>
						      	</ol>
						      </div>
						    </div>
						  </div>

						  <div class="card">
						    <div class="card-header p-0" id="headingThree" role="tab">
						      <h2 class="mb-0">
						        <button href="#collapseThree" class="d-flex py-3 px-4 align-items-center justify-content-between btn btn-link" data-parent="#accordion" data-toggle="collapse" aria-expanded="false" aria-controls="collapseThree">
						        	<p class="mb-0">What is the best grooming for your pets?</p>
						          <i class="fa" aria-hidden="true"></i>
						        </button>
						      </h2>
						    </div>
						    <div class="collapse" id="collapseThree" role="tabpanel" aria-labelledby="headingTwo">
						      <div class="card-body py-3 px-0">
						      	<ol>
						      		<li>Far far away, behind the word mountains</li>
						      		<li>Consonantia, there live the blind texts</li>
						      		<li>When she reached the first hills of the Italic Mountains</li>
						      		<li>Bookmarksgrove, the headline of Alphabet Village</li>
						      		<li>Separated they live in Bookmarksgrove right</li>
						      	</ol>
						      </div>
						    </div>
						  </div>

						  <div class="card">
						    <div class="card-header p-0" id="headingFour" role="tab">
						      <h2 class="mb-0">
						        <button href="#collapseFour" class="d-flex py-3 px-4 align-items-center justify-content-between btn btn-link" data-parent="#accordion" data-toggle="collapse" aria-expanded="false" aria-controls="collapseFour">
						        	<p class="mb-0">What are those requirements for sitting pets?</p>
						          <i class="fa" aria-hidden="true"></i>
						        </button>
						      </h2>
						    </div>
						    <div class="collapse" id="collapseFour" role="tabpanel" aria-labelledby="headingTwo">
						      <div class="card-body py-3 px-0">
						      	<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.</p>
						      </div>
						    </div>
						  </div>
						</div>
	        </div>
        </div>
    	</div>
    </section>--%>

        <section class="ftco-section testimony-section" style="background-image: url('images/bg_2.jpg');">
            <div class="overlay"></div>
            <div class="container">
                <div class="row justify-content-center pb-5 mb-3">
                    <div class="col-md-7 heading-section text-center ftco-animate">
                        <h2>Happy Clients &amp; Feedbacks</h2>
                    </div>
                </div>
                <div class="row ftco-animate">
                    <div class="col-md-12">
                        <div class="carousel-testimony owl-carousel ftco-owl">
                            <div class="item">
                                <div class="testimony-wrap py-4">
                                    <div class="icon d-flex align-items-center justify-content-center"><span class="fa fa-quote-left"></span></div>
                                    <div class="text">
                                        <p class="mb-4">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                                        <div class="d-flex align-items-center">
                                            <div class="user-img" style="background-image: url(images/person_1.jpg)"></div>
                                            <div class="pl-3">
                                                <p class="name">Roger Scott</p>
                                                <span class="position">Marketing Manager</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="item">
                                <div class="testimony-wrap py-4">
                                    <div class="icon d-flex align-items-center justify-content-center"><span class="fa fa-quote-left"></span></div>
                                    <div class="text">
                                        <p class="mb-4">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                                        <div class="d-flex align-items-center">
                                            <div class="user-img" style="background-image: url(images/person_2.jpg)"></div>
                                            <div class="pl-3">
                                                <p class="name">Roger Scott</p>
                                                <span class="position">Marketing Manager</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="item">
                                <div class="testimony-wrap py-4">
                                    <div class="icon d-flex align-items-center justify-content-center"><span class="fa fa-quote-left"></span></div>
                                    <div class="text">
                                        <p class="mb-4">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                                        <div class="d-flex align-items-center">
                                            <div class="user-img" style="background-image: url(images/person_3.jpg)"></div>
                                            <div class="pl-3">
                                                <p class="name">Roger Scott</p>
                                                <span class="position">Marketing Manager</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="item">
                                <div class="testimony-wrap py-4">
                                    <div class="icon d-flex align-items-center justify-content-center"><span class="fa fa-quote-left"></span></div>
                                    <div class="text">
                                        <p class="mb-4">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                                        <div class="d-flex align-items-center">
                                            <div class="user-img" style="background-image: url(images/person_1.jpg)"></div>
                                            <div class="pl-3">
                                                <p class="name">Roger Scott</p>
                                                <span class="position">Marketing Manager</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="item">
                                <div class="testimony-wrap py-4">
                                    <div class="icon d-flex align-items-center justify-content-center"><span class="fa fa-quote-left"></span></div>
                                    <div class="text">
                                        <p class="mb-4">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                                        <div class="d-flex align-items-center">
                                            <div class="user-img" style="background-image: url(images/person_2.jpg)"></div>
                                            <div class="pl-3">
                                                <p class="name">Roger Scott</p>
                                                <span class="position">Marketing Manager</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="ftco-section bg-light">
            <div class="container">
                <div class="row justify-content-center pb-5 mb-3">
                    <div class="col-md-7 heading-section text-center ftco-animate">
                        <h2>Affordable Packages</h2>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4 ftco-animate">
                        <div class="block-7">
                            <div class="img" style="background-image: url(imagen/pricing-1.jpg);"></div>
                            <div class="text-center p-4">
                                <span class="excerpt d-block">Personal</span>
                                <span class="price"><sup>$</sup> <span class="number">49</span> <sub>/mos</sub></span>

                                <ul class="pricing-text mb-5">
                                    <li><span class="fa fa-check mr-2"></span>5 Dog Walk</li>
                                    <li><span class="fa fa-check mr-2"></span>3 Vet Visit</li>
                                    <li><span class="fa fa-check mr-2"></span>3 Pet Spa</li>
                                    <li><span class="fa fa-check mr-2"></span>Free Supports</li>
                                </ul>

                                <a href="#" class="btn btn-primary d-block px-2 py-3">Get Started</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 ftco-animate">
                        <div class="block-7">
                            <div class="img" style="background-image: url(images/pricing-2.jpg);"></div>
                            <div class="text-center p-4">
                                <span class="excerpt d-block">Business</span>
                                <span class="price"><sup>$</sup> <span class="number">79</span> <sub>/mos</sub></span>

                                <ul class="pricing-text mb-5">
                                    <li><span class="fa fa-check mr-2"></span>5 Dog Walk</li>
                                    <li><span class="fa fa-check mr-2"></span>3 Vet Visit</li>
                                    <li><span class="fa fa-check mr-2"></span>3 Pet Spa</li>
                                    <li><span class="fa fa-check mr-2"></span>Free Supports</li>
                                </ul>

                                <a href="#" class="btn btn-primary d-block px-2 py-3">Get Started</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 ftco-animate">
                        <div class="block-7">
                            <div class="img" style="background-image: url(images/pricing-3.jpg);"></div>
                            <div class="text-center p-4">
                                <span class="excerpt d-block">Ultimate</span>
                                <span class="price"><sup>$</sup> <span class="number">109</span> <sub>/mos</sub></span>

                                <ul class="pricing-text mb-5">
                                    <li><span class="fa fa-check mr-2"></span>5 Dog Walk</li>
                                    <li><span class="fa fa-check mr-2"></span>3 Vet Visit</li>
                                    <li><span class="fa fa-check mr-2"></span>3 Pet Spa</li>
                                    <li><span class="fa fa-check mr-2"></span>Free Supports</li>
                                </ul>

                                <a href="#" class="btn btn-primary d-block px-2 py-3">Get Started</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center pb-5 mb-3">
                    <div class="col-md-7 heading-section text-center ftco-animate">
                        <h2>Pets Gallery</h2>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4 ftco-animate">
                        <div class="work mb-4 img d-flex align-items-end" style="background-image: url(images/gallery-1.jpg);">
                            <a href="images/gallery-1.jpg" class="icon image-popup d-flex justify-content-center align-items-center">
                                <span class="fa fa-expand"></span>
                            </a>
                            <div class="desc w-100 px-4">
                                <div class="text w-100 mb-3">
                                    <span>Cat</span>
                                    <h2><a href="work-single.html">Persian Cat</a></h2>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 ftco-animate">
                        <div class="work mb-4 img d-flex align-items-end" style="background-image: url(images/gallery-2.jpg);">
                            <a href="images/gallery-2.jpg" class="icon image-popup d-flex justify-content-center align-items-center">
                                <span class="fa fa-expand"></span>
                            </a>
                            <div class="desc w-100 px-4">
                                <div class="text w-100 mb-3">
                                    <span>Dog</span>
                                    <h2><a href="work-single.html">Pomeranian</a></h2>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 ftco-animate">
                        <div class="work mb-4 img d-flex align-items-end" style="background-image: url(images/gallery-3.jpg);">
                            <a href="images/gallery-3.jpg" class="icon image-popup d-flex justify-content-center align-items-center">
                                <span class="fa fa-expand"></span>
                            </a>
                            <div class="desc w-100 px-4">
                                <div class="text w-100 mb-3">
                                    <span>Cat</span>
                                    <h2><a href="work-single.html">Sphynx Cat</a></h2>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4 ftco-animate">
                        <div class="work mb-4 img d-flex align-items-end" style="background-image: url(images/gallery-4.jpg);">
                            <a href="images/gallery-4.jpg" class="icon image-popup d-flex justify-content-center align-items-center">
                                <span class="fa fa-expand"></span>
                            </a>
                            <div class="desc w-100 px-4">
                                <div class="text w-100 mb-3">
                                    <span>Cat</span>
                                    <h2><a href="work-single.html">British Shorthair</a></h2>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 ftco-animate">
                        <div class="work mb-4 img d-flex align-items-end" style="background-image: url(images/gallery-5.jpg);">
                            <a href="images/gallery-5.jpg" class="icon image-popup d-flex justify-content-center align-items-center">
                                <span class="fa fa-expand"></span>
                            </a>
                            <div class="desc w-100 px-4">
                                <div class="text w-100 mb-3">
                                    <span>Dog</span>
                                    <h2><a href="work-single.html">Beagle</a></h2>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 ftco-animate">
                        <div class="work mb-4 img d-flex align-items-end" style="background-image: url(images/gallery-6.jpg);">
                            <a href="images/gallery-6.jpg" class="icon image-popup d-flex justify-content-center align-items-center">
                                <span class="fa fa-expand"></span>
                            </a>
                            <div class="desc w-100 px-4">
                                <div class="text w-100 mb-3">
                                    <span>Dog</span>
                                    <h2><a href="work-single.html">Pug</a></h2>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="ftco-section bg-light">
            <div class="container">
                <div class="row justify-content-center pb-5 mb-3">
                    <div class="col-md-7 heading-section text-center ftco-animate">
                        <h2>Latest news from our blog</h2>
                    </div>
                </div>
                <div class="row d-flex">
                    <div class="col-md-4 d-flex ftco-animate">
                        <div class="blog-entry align-self-stretch">
                            <a href="blog-single.html" class="block-20 rounded" style="background-image: url('images/image_1.jpg');"></a>
                            <div class="text p-4">
                                <div class="meta mb-2">
                                    <div><a href="#">April 07, 2020</a></div>
                                    <div><a href="#">Admin</a></div>
                                    <div><a href="#" class="meta-chat"><span class="fa fa-comment"></span>3</a></div>
                                </div>
                                <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control about the blind texts</a></h3>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 d-flex ftco-animate">
                        <div class="blog-entry align-self-stretch">
                            <a href="blog-single.html" class="block-20 rounded" style="background-image: url('images/image_2.jpg');"></a>
                            <div class="text p-4">
                                <div class="meta mb-2">
                                    <div><a href="#">April 07, 2020</a></div>
                                    <div><a href="#">Admin</a></div>
                                    <div><a href="#" class="meta-chat"><span class="fa fa-comment"></span>3</a></div>
                                </div>
                                <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control about the blind texts</a></h3>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 d-flex ftco-animate">
                        <div class="blog-entry align-self-stretch">
                            <a href="blog-single.html" class="block-20 rounded" style="background-image: url('images/image_3.jpg');"></a>
                            <div class="text p-4">
                                <div class="meta mb-2">
                                    <div><a href="#">April 07, 2020</a></div>
                                    <div><a href="#">Admin</a></div>
                                    <div><a href="#" class="meta-chat"><span class="fa fa-comment"></span>3</a></div>
                                </div>
                                <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control about the blind texts</a></h3>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="ftco-appointment ftco-section ftco-no-pt ftco-no-pb img" style="background-image: url(images/bg_3.jpg);">
            <div class="overlay"></div>
            <div class="container">
                <div class="row d-md-flex justify-content-end">
                    <div class="col-md-12 col-lg-6 half p-3 py-5 pl-lg-5 ftco-animate">
                        <h2 class="mb-4">Free Consultation</h2>
                        <form action="#" class="appointment">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <div class="form-field">
                                            <div class="select-wrap">
                                                <div class="icon"><span class="fa fa-chevron-down"></span></div>
                                                <select name="" id="" class="form-control">
                                                    <option value="">Select services</option>
                                                    <option value="">Cat Sitting</option>
                                                    <option value="">Dog Walk</option>
                                                    <option value="">Pet Spa</option>
                                                    <option value="">Pet Grooming</option>
                                                    <option value="">Pet Daycare</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <input type="text" class="form-control" placeholder="Your Name" />.
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <input type="text" class="form-control" placeholder="Vehicle number" />.
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <div class="input-wrap">
                                            <div class="icon"><span class="fa fa-calendar"></span></div>
                                            <input type="text" class="form-control appointment_date" placeholder="Date" />
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <div class="input-wrap">
                                            <div class="icon"><span class="fa fa-clock-o"></span></div>
                                            <input type="text" class="form-control appointment_time" placeholder="Time" />
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <textarea name="" id="" cols="30" rows="7" class="form-control" placeholder="Message"></textarea>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <input type="submit" value="Send message" class="btn btn-primary py-3 px-4">
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>

        <footer class="footer">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 col-lg-3 mb-4 mb-md-0">
                        <h2 class="footer-heading">Petsitting</h2>
                        <p>A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
                        <ul class="ftco-footer-social p-0">
                            <li class="ftco-animate"><a href="#" data-toggle="tooltip" data-placement="top" title="Twitter"><span class="fa fa-twitter"></span></a></li>
                            <li class="ftco-animate"><a href="#" data-toggle="tooltip" data-placement="top" title="Facebook"><span class="fa fa-facebook"></span></a></li>
                            <li class="ftco-animate"><a href="#" data-toggle="tooltip" data-placement="top" title="Instagram"><span class="fa fa-instagram"></span></a></li>
                        </ul>
                    </div>
                    <div class="col-md-6 col-lg-3 mb-4 mb-md-0">
                        <h2 class="footer-heading">Latest News</h2>
                        <div class="block-21 mb-4 d-flex">
                            <a class="img mr-4 rounded" style="background-image: url(images/image_1.jpg);"></a>
                            <div class="text">
                                <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control about</a></h3>
                                <div class="meta">
                                    <div><a href="#"><span class="icon-calendar"></span>April 7, 2020</a></div>
                                    <div><a href="#"><span class="icon-person"></span>Admin</a></div>
                                    <div><a href="#"><span class="icon-chat"></span>19</a></div>
                                </div>
                            </div>
                        </div>
                        <div class="block-21 mb-4 d-flex">
                            <a class="img mr-4 rounded" style="background-image: url(images/image_2.jpg);"></a>
                            <div class="text">
                                <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control about</a></h3>
                                <div class="meta">
                                    <div><a href="#"><span class="icon-calendar"></span>April 7, 2020</a></div>
                                    <div><a href="#"><span class="icon-person"></span>Admin</a></div>
                                    <div><a href="#"><span class="icon-chat"></span>19</a></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3 pl-lg-5 mb-4 mb-md-0">
                        <h2 class="footer-heading">Quick Links</h2>
                        <ul class="list-unstyled">
                            <li><a href="#" class="py-2 d-block">Home</a></li>
                            <li><a href="#" class="py-2 d-block">About</a></li>
                            <li><a href="#" class="py-2 d-block">Services</a></li>
                            <li><a href="#" class="py-2 d-block">Works</a></li>
                            <li><a href="#" class="py-2 d-block">Blog</a></li>
                            <li><a href="#" class="py-2 d-block">Contact</a></li>
                        </ul>
                    </div>
                    <div class="col-md-6 col-lg-3 mb-4 mb-md-0">
                        <h2 class="footer-heading">Have a Questions?</h2>
                        <div class="block-23 mb-3">
                            <ul>
                                <li><a href="#"><span class="icon fa fa-phone"></span><span class="text">+503 7053 1387</span></a></li>
                                <li><a href="#"><span class="icon fa fa-paper-plane"></span><span class="text">huellitas.adopt@gmail.com</span></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="row mt-5">
                    <div class="col-md-12 text-center">

                        <p class="copyright">
                            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                            Copyright &copy;<script>document.write(new Date().getFullYear());</script>
                            All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i>by <a href="https://colorlib.com" target="_blank">Colorlib.com</a>
                            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        </p>
                    </div>
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
