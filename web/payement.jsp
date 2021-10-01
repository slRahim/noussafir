<!DOCTYPE html>
<html lang="fr">

<%
    response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
    if(session.getAttribute("id_membre")==null){
        response.sendRedirect("/Acceuil");
    }
%>

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="static/css/bootstrap.min.css">
    <!-- Material Design Bootstrap -->
    <link href="static/css/mdb.min.css" rel="stylesheet">

    <link href="static/css/mycss1.css" rel="stylesheet">
    <title>Payer</title>
</head>
<body>
<nav>
    <c:import url="nav_membre.jsp"/>
</nav>

<section id="payer">
    <div class="container">
        <div class="row">
            <div class="col-sm-12 col-md-12 col-lg-6">
                <img src="static/img/payement.png" style="max-width: 100%">
            </div>
            <div class="col-sm-12 col-md-12 col-lg-6">
                <br><br><br><br><br><br>
                <div class="card mb-3" style="max-width: 100%;">
                    <div class="card-body ">
                        <form action="Payer" method="post">
                            <input type="hidden" name="id_reservation" value="${id_reservation}">
                            <div class="md-form form-lg">
                                <input type="text" id="id_carte" name="id_carte" class="form-control">
                                <label for="id_carte">Numero de la carte</label>
                            </div>

                            <div class="md-form form-lg">
                                <input type="password" id="pass" class="form-control" >
                                <label for="pass">Votre mot de passe</label>
                            </div>
                            <br><br>
                            <div class="form-group row">
                                <label  class="col-sm-2 col-form-label"></label>
                                <div class="col">
                                    <div class="custom-control custom-checkbox my-1 mr-sm-2">
                                        <input type="checkbox" class="custom-control-input" id="verefie" onclick="v_payement()">
                                        <label class="custom-control-label" for="verefie" >Verefie moi! </label>
                                    </div>
                                </div>
                            </div>

                            <br><br>
                            <div class=" mt-4">
                                <button class="btn btn-success" id="payement" type="submit" disabled>Payer</button>
                            </div>
                        </form>
                    </div>
                </div>

            </div>

        </div>

    </div>

</section>


<section>
    <c:import url="footer.jsp"/>
</section>




<-- verefie les D de payement !-->
<script>


    function v_payement(){
        if(document.getElementById('id_carte').value!='' && document.getElementById('pass').value!='' ){

            document.getElementById('payement').disabled=false ;
        }
        else {
            swal("Ooops!", "Veulleirz remplir tout les champs SVP !", "info");
        }
    }


</script>





<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js" ></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js" ></script>

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<!-- JQuery -->
<script type="text/javascript" src="static/js/jquery-3.2.1.min.js"></script>
<!-- Bootstrap tooltips -->
<script type="text/javascript" src="static/js/popper.min.js"></script>
<script src="static/js/bootstrap.min.js"></script>
<!-- MDB core JavaScript -->
<script type="text/javascript" src="static/js/mdb.min.js"></script>
<script>
    $(function () {
        $('[data-toggle="popover"]').popover()
    })

</script>
</body>
</html>
