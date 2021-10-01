<!doctype html>
<html lang="frr">

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
    <!-- Mon fichier de  CSS -->
    <link href="static/css/mycss1.css" rel="stylesheet">

    <title>Statistique du site</title>
</head>
<body>

<nav class="navbar sticky-top navbar-expand-lg navbar-dark bg-dark " >
    <a class="navbar-brand" href="profile_admin.jsp">
        <img src="static/img/logo.png" style="width: 60px;">
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar4" aria-controls="navbar4" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div id="navbar4" class="collapse navbar-collapse mypading" >
        <ul class="navbar-nav mr-auto ">

        </ul>
        <a data-toggle="popover" data-placement="bottom" title="Notification" data-content="<c:forEach items="${liste_notification}" var="notify">${notify}</c:forEach>">
            <img src="static/img/icons8_Notification_35px.png">
            <span class="badge badge-light">${nombre_notification}</span>
        </a>
        <a href="<c:url value="/Acceuil"></c:url>" class="btn btn-md  btn-danger" style="margin-left: 2%">Se deconnecter</a>
    </div>
</nav>



<section style="padding: 60px">

    <div class="container">
        <h3 class="d-flex justify-content-center"> Statistique des membre </h3>
    </div>
    <br><br>
    <div class="container">
        <div class="container">
            <!-- la partie des stat des membres actifs et bloquers -->
            <div id="chartContainer2" style="height: 370px; max-width: 90%; margin: 0px auto;"></div>
        </div>
        <br><br><br>
        <div class="row">
            <div class="col-sm-12 col-md-12 col-lg-6">
                <div class="card" style="max-width:100%">
                    <!-- Card image -->
                    <div class="view overlay">
                        <img class="card-img-top" src="${max_publier.image}">
                    </div>

                    <!-- Card content -->
                    <div class="card-body text-center">

                        <!-- Title -->
                        <h4 class="card-title"><strong>Membre qui a publier le plus du trajets</strong></h4>
                        <!-- Subtitle -->
                        <h5 class="blue-text pb-2"><strong>${max_publier.nom_utilisateur}</strong></h5>
                        <!-- Text -->
                        <p class="card-text">Nom :${max_publier.nom} ***** Prenom : ${max_publier.prenom} <br>  Note : ${max_publier.note}  </p>
                    </div>
                </div>

                <br>
            </div>
            <br><br>
            <div class="col-sm-12 col-md-12 col-lg-6">
                <div class="card card-cascade wider" style="max-width: 100%">
                    <!-- Card image -->
                    <div class="view overlay">
                        <img class="card-img-top" src="${max_note.image}" alt="Card image cap">
                    </div>

                    <!-- Card content -->
                    <div class="card-body text-center">

                        <!-- Title -->
                        <h4 class="card-title"><strong>Meilleur membre du site</strong></h4>
                        <!-- Subtitle -->
                        <h5 class="blue-text pb-2"><strong>${max_note.nom_utilisateur}</strong></h5>
                        <!-- Text -->
                        <p class="card-text">Nom :${max_note.nom} ***** Prenom : ${max_note.prenom} <br>  Note : ${max_note.note} </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section style="padding: 60px">

    <div class="container">
        <h3 class="d-flex justify-content-center"> Statistique des trajets </h3>
    </div>
    <br><br>
    <div class="container">
        <!-- la partie des stat du benefice du site -->
        <div id="chartContainer4" style="height: 370px; max-width: 90%; margin: 0px auto;"></div>
    </div>
    <br><br><br>
    <div class="container">
        <div class="row">
            <div class="col-sm-12 col-md-12 col-lg-6">
                <div class="card card-cascade wider" style="max-width: 100%">
                    <!-- Card image -->
                    <div class="view overlay d-flex justify-content-center">
                        <img class="card-img-top" src="static/img/002-placeholder.svg" style="width: 250px">
                    </div>

                    <!-- Card content -->
                    <div class="card-body text-center">

                        <!-- Title -->
                        <h4 class="card-title"><strong>${max_depart}</strong></h4>
                        <!-- Text -->
                        <p class="card-text"> c'est la ville la plus frequente pour le depart des covoiturage . </p>
                    </div>
                </div>
                <br>
            </div>
            <br><br><br>
            <div class="col-sm-12 col-md-12 col-lg-6">
                <div class="card card-cascade wider" style="max-width: 100%">
                    <!-- Card image -->
                    <div class="view overlay d-flex justify-content-center">
                        <img class="card-img-top" src="static/img/001-direction.svg" alt="Card image cap" style="width:250px" >
                    </div>

                    <!-- Card content -->
                    <div class="card-body text-center">

                        <!-- Title -->
                        <h4 class="card-title"><strong>${max_arriver}</strong></h4>
                        <!-- Text -->
                        <p class="card-text"> c'est la destination preferer par les voyageurs inscrivent dans le site . </p>
                    </div>
                </div>
            </div>
        </div>
    </div>

</section>


<section style="padding: 60px">

    <div class="container">
        <h3 class="d-flex justify-content-center"> Statistique des résérvations </h3>
    </div>
    <br><br>
    <div class="container">
        <div class="row">
            <div class="col-sm-12 col-md-12 col-lg-6">
                <!-- le graphe des reservation anuuler en cours et valide -->
                <div id="chartContainer3" style="height: 370px; max-width: 60%; margin: 0px auto;"></div>
                <br>
            </div>
            <br><br>
            <div class="col-sm-12 col-md-12 col-lg-6">
                <jsp:include page="graphe_utilisateur.jsp"/>
                <br><br>
                <h4><strong>La circulation des données </strong></h4>
            </div>
        </div>
    </div>

</section>

<section id="footer_admin">
    <div class="container">
        <div class="row">
            <div class="col-sm-12 col-lg-6 mypadinginscrit ">

            </div>
            <div class="col-sm-12 col-lg-6 mypadinginscrit ">
                <div class="container">
                    <h6>A propos :</h6>
                    <ul class="container">
                        <p>nouSSafir est une solution propose par un groupe d'étudiant Algerien pour economiser le budget du depalcement.</p>
                    </ul>
                    <h6>Contact :</h6>
                    <ul class="container">
                        <ol> Adress : Cité 180 LTG BT 03 N 10 El-Khroub Constantine</ol>
                        <ol> TEL : +213 559 637 536</ol>
                        <ol>
                            <a href="https://www.facebook.com"><img src="static/img/icons8_Facebook_30px_1.png"></a>
                            <a href="https://www.twitter.com"><img src="static/img/icons8_Twitter_30px_1.png"></a>
                            <a href="https://www.youtube.com/"><img src="static/img/icons8_YouTube_30px.png"></a>
                        </ol>
                    </ul>
                </div>
            </div>
        </div>
        <br><br><br>
        <p style="text-align: center"><strong>CopyRight-2018-Force3 </strong></p>
    </div>

</section>







<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<!-- JQuery -->
<script type="text/javascript" src="static/js/jquery-3.2.1.min.js"></script>
<!-- Bootstrap tooltips -->
<script type="text/javascript" src="static/js/popper.min.js"></script>
<script src="static/js/bootstrap.min.js"></script>
<!-- MDB core JavaScript -->
<script type="text/javascript" src="static/js/mdb.min.js"></script>
<script> new WOW().init(); </script>
<script>
    $(function () {
        $('[data-toggle="popover"]').popover()
    })

</script>



</body>
</html>