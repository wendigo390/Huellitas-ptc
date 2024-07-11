<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AgregarProducto1.aspx.cs" Inherits="Huellitas_ptc.AgregarProducto1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:200,300,400,500,600,700,800&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/animate.css">
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">


    <link rel="stylesheet" href="css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="css/jquery.timepicker.css">

    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

    <body class="bg-default">
        <form id="form1" runat="server">
            <div class="main-content">
                <!-- Navbar -->


                <script type="text/javascript">
                    function validar(e) { // 1
                        tecla = (document.all) ? e.keyCode : e.which; // 2
                        if (tecla == 8) return true; // 3
                        patron = /[A-Za-z\s]/; // 4
                        te = String.fromCharCode(tecla); // 5
                        return patron.test(te); // 6
                    }
</script>
                <script type="text/javascript">
                    function numeros(nu) { // 1
                        tecla = (document.all) ? e.keyCode : e.which; // 2
                        if (tecla == 8) return true; // 3
                        ppatron = /\d/; // Solo acepta números// 4
                        te = String.fromCharCode(tecla); // 5
                        return patron.test(te); // 6
                    }
</script>

                <script>
                    function NumCheck(e, field) {
                        key = e.keyCode ? e.keyCode : e.which
                        // backspace
                        if (key == 8) return true
                        // 0-9
                        if (key > 47 && key < 58) {
                            if (field.value == "") return true
                            regexp = /.[0-9]{2}$/
                            return !(regexp.test(field.value))
                        }
                        // .
                        if (key == 46) {
                            if (field.value == "") return false
                            regexp = /^[0-9]+$/
                            return regexp.test(field.value)
                        }
                        // other key
                        return false
                    }
</script>



                <title>Registro de Animales</title>
                <style>
                    /* Estilos para la plantilla */
                    body {
                        font-family: Arial, sans-serif;
                    }

                    .form-container {
                        width: 50%;
                        margin: 40px auto;
                        padding: 20px;
                        border: 1px solid #ccc;
                        border-radius: 10px;
                        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                    }

                    .form-label {
                        display: block;
                        margin-bottom: 10px;
                    }

                    .form-input {
                        width: 100%;
                        padding: 10px;
                        margin-bottom: 20px;
                        border: 1px solid #ccc;
                    }

                        .form-input[type="file"] {
                            padding: 10px 0;
                        }

                    .form-button {
                        background-color: #4CAF50;
                        color: #fff;
                        padding: 10px 20px;
                        border: none;
                        border-radius: 5px;
                        cursor: pointer;
                    }

                        .form-button:hover {
                            background-color: #3e8e41;
                        }
                </style>

                <div class="form-container">
                    <h2>Añadir Producto</h2>
                    <div class="form-label">
                        <label for="nombre">Nombre:</label>
                        <asp:TextBox type="text" ID="nombre" runat="server" class="form-input" onkeypress="return validar(event)" />
                    </div>
                    <div class="form-label">
                        <label for="edad">Marca:</label>
                        <asp:TextBox type="text" ID="Textbox1" runat="server" class="form-input" onkeypress="return validar(event)" />
                    </div>
                    <div class="form-label">
                        <label for="peso">Cantidad:</label>
                        <asp:TextBox type="text" ID="Textbox2" runat="server" class="form-input" onkeypress="return NumCheck(event, this)" />
                    </div>
                    <div class="form-label">
                        <label for="Precio">Precio:</label>
                        <asp:TextBox type="Precio" ID="precio" runat="server" class="form-input"  onkeypress="return NumCheck(event, this)" />
                    </div>
                    <div class="form-label">
                        <label for="foto">Foto:</label>
                        <asp:FileUpload runat="server" type="file" ID="foto" class="form-input" />
                    </div>
                    <div class="form-label">
                        Descripción<label for="comentario">:</label>
                        <asp:TextBox type="text" ID="Textbox3" runat="server" class="form-input" onkeypress="return validar(event)" />
                    </div>
                    <asp:Button runat="server" Text="Agregar" CssClass="mybtn" BackColor="#5E72E4" Width="130px" Height="50px" ForeColor="White"></asp:Button>
                </div>













            </div>
        </form>
    </body>

</body>
</html>
