<!DOCTYPE html>
<html lang="fr">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="static/css/bootstrap.min.css">
    <!-- Material Design Bootstrap -->
    <link href="static/css/mdb.min.css" rel="stylesheet">
    <!-- Mon fichier de  CSS -->
    <link rel="stylesheet" href="static/css/mycss.css">

    <title>Recherche</title>
</head>
<body>

<nav class="navbar sticky-top navbar-expand-lg navbar-dark bg-dark " >
    <a class="navbar-brand" href="Acceuil.jsp">
        <img src="static/img/logo.png" style="width:60px;">
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse mypading  " id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto ">

        </ul>
        <a href="Acceuil.jsp" class="btn  btn-info">Connecter</a>
    </div>
</nav>

<section id="recherche_visiteur" class="mytxtblanc parallax">
    <div class="container">
        <div class="container" style="text-align: center">
            <h5>Rechercher une destination </h5>
            <p>Rechrechez une déstiantion et reserver votre place dés maitenant Go...GO</p>
        </div>
        <br>
        <!-- le formullaire de la recherche d'une destiantion-->

        <div class="container" >
            <div class="row">
                <div class="col-sm-12 col-md-12 col-lg-6 mypadinginscrit ">
                    <form action="Recherche" method="post">
                        <div class="form-group">
                            <label for="start">Ville de depart :</label>
                            <input type="text" class="form-control" id="start" name="ville_depart"  placeholder="Ville de depart">
                        </div>
                        <div class="form-group">
                            <label for="end">Ville d'arriver :</label>
                            <input type="text" class="form-control" id="end" name="ville_arriver" placeholder="Ville d'arriver">
                        </div>
                        <div class="form-group">
                            <label for="dateD">Date de depart :</label>
                            <input type="date" class="form-control" id="dateD" name="date_depart" placeholder="Date de depart">
                        </div>
                        <br>
                        <button id="get" type="submit" class="btn btn-danger btn-md" >Rechercher</button>
                    </form>

                </div>
                <div class="col-sm-12 col-md-12 col-lg-6 mypadinginscrit">
                    <div id="map"></div>
                    <!-- place reserver pour la carte gps de google -->
                </div>
            </div>
        </div>
    </div>


</section>

<section id="resultat">
    <div class="container mytxt">
        <h5>Resultat de recherche </h5>
    </div>
    <br>
    <!-- le resultat de recherche en carte-->

    <div class="container">
        <div class="row">
            <c:forEach items="${liste_trajet}" var="trajet">
                <div class="col-sm-12 col-md-12 col-lg-4">
                    <div class="card bg-light mb-3" style="width: 18rem;">
                        <div class="card-body">
                            <h5 class="card-title">Id_trajet :${trajet.id_trajet}</h5>
                            <p class="card-text">
                                Depart : ${trajet.v_depart} <br>
                                Arriver : ${trajet.v_arriver} <br>
                                Date depart : ${trajet.date_dapart} <br>
                                Heur depart : ${trajet.h_depart}<br>
                                Nombre de place : ${trajet.nombre_place} <br>
                                Prix : ${trajet.prix} DA
                            </p>
                            <div class="card-footer">
                                <a href="page_inscription.jsp" class="btn btn-primary">Reserver</a>
                                <a href="<c:url value="/ConsulterTrajet"><c:param name="id_trajet" value="${trajet.id_trajet}"/></c:url>" target="_blank"><img src="static/img/icons8_Opera_Glasses_30px.png"></a>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

</section>

<section>
    <c:import url="footer.jsp"/>

</section>






<!-- script de la date minimale-->
<script>

    var today = new Date();
    var dd = today.getDate();
    var mm = today.getMonth()+1; //January is 0!
    var yyyy = today.getFullYear();
    if(dd<10){
        dd='0'+dd
    }
    if(mm<10){
        mm='0'+mm
    }

    today = yyyy+'-'+mm+'-'+dd;
    document.getElementById("dateD").setAttribute("min", today);

</script>

<!--speciale pour importer le google map api et le les fonctions defenie dans script_map.js  -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyArft1j_q20ao97RVTqcXeKdQoIzXUwFlA&libraries=places&callback=initMap"
        async defer></script>
<script src="static/js/script_map.js"></script>

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<!-- JQuery -->
<script type="text/javascript" src="static/js/jquery-3.2.1.min.js"></script>
<!-- Bootstrap tooltips -->
<script type="text/javascript" src="static/js/popper.min.js"></script>
<script src="static/js/bootstrap.min.js"></script>
<!-- MDB core JavaScript -->
<script type="text/javascript" src="static/js/mdb.min.js"></script>
</body>
</html>
