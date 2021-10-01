
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
    <link href="static/css/mycss.css" rel="stylesheet">
    <title>Bonjour</title>
</head>
<body>


<nav>
    <c:import url="nav_membre.jsp"/>
</nav>


<section id="head" class="parallax">
    <div class="text-white text-center d-flex justify-content-center " style="padding-top: 20%">
        <div class="wow fadeInDown" data-wow-delay="0.3s" style="visibility: visible ;">
            <h1 class="card-title pt-2"><strong>Bienvenus</strong></h1>
            <p>
                pour passer à l'utilisation de votre compte ; pour publier un trajet ou reserver,rendez-vous dans la setcion si-desous
            </p>
            <p>
                siuvrez votre profile ou modifiez vos information personnel cliquez sur le bouton
            </p>
            <a href="<c:url value="/ConsulterProfile"><c:param name="id_membre" value="${id_membre}"/></c:url>" class="btn btn-pink">Consulter votre profile</a>
        </div>
    </div>


</section>


<section id="corp">
    <br><br><br>
    <div class="container wow fadeInLeft" data-wow-delay="0.3s" style="visibility: visible">
        <div class="jumbotron wow fadeInLeft" data-wow-delay="0.3s" style="visibility: visible">

            <h1>Bonjour ${id_membre}</h1>
            <p class="lead">Veuillez choisir un mode de connexion si-dessous. </p>
            <hr class="my-4">
            <div class="row">
                <div class="col-sm-12 col-lg-6">
                    <h6>Mode conducteur :</h6>
                    <p> Dans ce mode vous pouvez faire la gestion d'un trajet (publier , consulter) aussi le suivie des demmandes de voyageur dans un trajet déja publier .</p>
                    <p>
                        <a class="btn btn-success btn-lg" href="<c:url value="/Conducteur"><c:param name="id_membre" value="${id_membre}"/></c:url>" role="button">
                            Allez-y</a>
                    </p>
                </div>
                <div class="col-sm-12 col-lg-6">
                    <h6>Mode voyageur :</h6>
                    <p>Dans ce mode vous pouvez rechercher un covoiturage et suivre les demmandes de reservation déja déposer .</p> <br>
                    <p>
                        <a class="btn btn-success btn-lg" href="<c:url value="/Voyageur"><c:param name="id_membre" value="${id_membre}"/></c:url>" role="button">
                            Allez-y</a>
                    </p>
                </div>
            </div>

        </div>
    </div>

</section>

<section>
    <!-- Card -->
    <div class="card card-image" style="background-image:url(static/img/background3.png)">
        <div class="text-white text-center d-flex align-content-center rgba-black-strong py-5 px-4">
            <div style="margin-left: 45%">
                <p>
                    <a href=""><img src="static/img/005-facebook.png"></a>
                    <a href=""><img src="static/img/001-google-plus.png"></a>
                    <a href=""><img src="static/img/002-twitter.png"></a>
                    <a href=""><img src="static/img/003-snapchat.png"></a>
                    <a href=""><img src="static/img/004-instagram.png"></a>
                </p>
            </div>
        </div>
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
