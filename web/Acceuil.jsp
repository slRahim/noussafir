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

  <title>Acceuil</title>
</head>
<body>
<!-- la bare de navigation -->
<nav class="navbar sticky-top navbar-expand-lg navbar-dark bg-dark " >
  <a class="navbar-brand" href="/Acceuil">
    <img src="static/img/logo.png" style="width: 60px;">
  </a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar2" aria-controls="navbar2" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div id="navbar2" class="collapse navbar-collapse mypading" >
    <ul class="navbar-nav mr-auto ">
      <li class="nav-item">
        <a class="nav-link" data-scroll="" href="#home"> Home </a>
      </li>
      <li class="nav-item ">
        <a class="nav-link" data-scroll="" href="#recherche">Destination</a>
      </li>
      <li class="nav-item ">
        <a class="nav-link" data-scroll="" href="#statistique">Statistique</a>
      </li>
      <li class="nav-item ">
        <a class="nav-link" data-scroll="" href="#avantage">Avantage</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" data-scroll="" href="#footer">Contacter</a>
      </li>
    </ul>
    <a href="#home" class="btn  btn-success" style="margin-right: 2%">Connexion</a>
    <a href="page_inscription.jsp" class="btn  btn-info">S'inscrire</a>
  </div>
</nav>


<section>
  <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
    <div class="carousel-inner">
      <div class="carousel-item active">
        <img class="d-block w-100" src="static/img/Covoiturage_Entete.png" alt="First slide">
      </div>
      <div class="carousel-item">
        <img class="d-block w-100" src="static/img/covoiturage2.png" alt="Second slide">
      </div>
      <div class="carousel-item">
        <img class="d-block w-100" src="static/img/vintage-volkswagen-van-toy-1g-2560x1440.jpg" alt="Second slide">
      </div>
    </div>
    <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</section>

<section id="home" class="mytxtblanc parallax">
  <br><br><br>
  <div class="d-flex justify-content-lg-end">
      <div class="col-sm-12 col-md-12 col-lg-6">
        <div class="card text-dark bg-light mb-3" style="max-width: 30rem; margin-left: 20%">
          <div class="card-body">
            <!-- formulaire de authentifie-->
            <form action="Acceuil" method="post">
              <div class="form-group">
                <label for="id_mail1">Adress Email</label>
                <input type="email" class="form-control" id="id_mail1" name="id_email" aria-describedby="emailHelp" placeholder="Enter email">
              </div>
              <div class="form-group">
                <label for="motdpasse">Mot de passe </label>
                <input type="password" class="form-control" id="motdpasse" name="mot de passe" placeholder="Votre mot de passe">
              </div>
              <div>
                <a  href="page_inter_pass_oublier.jsp">Mot de passe oublier</a>
              </div>
              <br>
              <button type="submit" class="btn btn-warning">Connexion</button>
            </form>
          </div>
        </div>

      </div>
  </div>

</section>

<section id="recherche">
  <div class="container mytxt">
    <h5>Rechercher une destination </h5>
    <p>rechrechez une destiantion et reserver votre place dés maitenant Go...GO</p>
  </div>
  <br>
  <!-- le formullaire de la recherche d'une destiantion-->

  <div class="container" >
    <div class="row">
      <div class="col-sm-12 col-md-12 col-lg-6 mypadinginscrit wow fadeInLeft" data-wow-delay="0.3s" style="visibility: visible " >
        <div class="card text-dark bg-light mb-3" style="max-width: 40rem;">
          <div class="card-body">
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
        </div>
      </div>
      <div class="col-sm-12 col-md-12 col-lg-6 mypadinginscrit wow fadeInRight" data-wow-delay="0.3s" style="visibility: visible" >
        <div id="map"></div>
        <!-- place reserver pour la carte gps de google -->
      </div>
    </div>
  </div>
</section>

<div class="container"><hr></div>

<section id="definition" style="padding: 60px">

  <div class="container">
    <div class="row">
      <div class="col-sm-12 col-md-12 col-lg-6">
        <img src="static/img/Covoiturage_bleu.png" style="max-width: 100%">
      </div>
      <br> <br>
      <div class="col-sm-12 col-md-12 col-lg-6">
        <br><br>
        <p >
          À la différence du taxi où le passager choisit la destination, en covoiturage, c'est le conducteur qui offre de partager son véhicule, éventuellement gratuitement6 et fixe le trajet.
          Un conducteur propose aux passagers de les transporter dans sa voiture pour un trajet (ou une portion de trajet) qu'il doit lui-même effectuer, et donc à la date et à l'heure qu'il a décidées. Généralement, le lieu de départ, déterminé à l'avance, est le même pour tout le monde. À l'arrivée, le conducteur dépose les passagers là où lui-même s'arrête, ou bien à l'endroit que chacun souhaite, en évitant de faire un grand détour. Il peut alors laisser ses passagers par exemple à proximité d'un transport en commun ou bien là où un membre de la famille ou un ami pourront les prendre en charge.
        </p>
      </div>
    </div>
  </div>

</section>

<section id="avantage" class="parallax mytxtblanc">
  <br><br>
  <div class="container">
    <div class="row" style="padding-top: 10%">
      <div class="col-sm-12 col-md-12 col-lg-4 mypadinginscrict">
        <div class="container mytxt">
          <img src="static/img/economie.png" width="150px" class="animated bounce infinite">
          <br> <br>
          <h5>Economique  </h5>
          <p> reduisez vos couts de voyages avec notre solution de covoiturage</p>
        </div>
      </div>
      <div class="col-sm-12 col-md-12 col-lg-4 mypadinginscrict">
        <div class="container mytxt">
          <img src="static/img/environement.png" width="150px" class="animated bounce infinite">
          <br> <br>
          <h5>Environement </h5>
          <p>Participez à la protection de notre environement contre le CO2</p>
        </div>
      </div>
      <div class="col-sm-12 col-md-12 col-lg-4 mypadinginscrict">
        <div class="container mytxt">
          <img src="static/img/lock-flat.png" width="150px" class="animated bounce infinite">
          <br> <br>
          <h5>Securiser  </h5>
          <p>
            voyagez en toute securiter dans les covoiturages de site.
            protection de vos données perssonel.
          </p>
        </div>
      </div>
    </div>
  </div>

</section>

<section id="covoiturage">
  <div class="container mytxt">
    <h5>Dernier ajouter</h5>
    <p> Les dernier trajets publier.allez reserver vous</p>
  </div>
  <br>
  <div class="container">
    <div class="row wow fadeInLeft" data-wow-delay="0.3s" style="visibility: visible">
      <c:forEach items="${liste_trajet}" var="trajet">
        <div class="col-sm-12 col-md-12 col-lg-4">
          <div class="card mb-3" style="max-width: 100%">
            <div class="card-body">
              <h5 class="card-title">Id_trajet :${trajet.id_trajet}</h5>
              <p class="card-text">
                 Depart : ${trajet.v_depart} <br>
                 Arriver : ${trajet.v_arriver} <br>
                 Date depart : ${trajet.date_dapart} <br>
                 Nombre de place : ${trajet.nombre_place} <br>
                 Prix : ${trajet.prix}
              </p>
            </div>
            <div class="card-footer">
              <a href="page_inscription.jsp" class="btn btn-warning">Reserver</a>
              <a href="<c:url value="/ConsulterTrajet"><c:param name="id_trajet" value="${trajet.id_trajet}"/></c:url>" target="_blank"><img src="static/img/icons8_Opera_Glasses_30px.png"></a>
            </div>
          </div>
        </div>
      </c:forEach>
    </div>
  </div>

  <hr>

</section>

<section id="statistique">

  <div id="carouselExampleControls2" class="carousel slide wow fadeInLeft" data-wow-delay="0.3s" style="visibility: visible" data-ride="carousel">
    <div class="carousel-inner">

      <div class="carousel-item active">
        <div class="container">
          <div class="row">
            <div class="col-sm-12 col-lg-6 mypadinginscrit">
              <div class="container mytxt">
                <img src="static/img/nbutilisateur.png" width="150px">
                <br> <br>
                <h5>Les utilisateurs de notre site  </h5>
                <p> notre site est utiliser par plus de ${stat1} KO utilisateur </p>
              </div>
            </div>
            <div class="col-sm-12 col-lg-6 mypadinginscrit">
              <!--le diagrame-->
              <c:import url="graphe_acceuil.jsp"/>
            </div>
          </div>
        </div>
      </div>
      <div class="carousel-item">
        <div class="container">
          <div class="row">
            <div class="col-sm-12 col-lg-6 mypadinginscrit">
              <div class="container mytxt">
                <img src="static/img/visiter.png" width="150px">
                <br> <br>
                <h5>Les visiteur de site  </h5>
                <p> on a plus de ${stat2} KO visiteur chaque jour</p>
              </div>
            </div>
            <div class="col-sm-12 col-lg-6 mypadinginscrit">
              <div class="container mytxt">
                <img src="static/img/people-icon.png" width="150px">
                <br> <br>
                <h5> Le taux de devlopement </h5>
                <p>presque ${stat4} KO personne rejoint notre famille chaque mois </p>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="carousel-item">
        <div class="container">
          <div class="row">
            <div class="col-sm-12 col-lg-6 mypadinginscrit">
              <div class="container mytxt">
                <img src="static/img/destination.png" width="150px">
                <br> <br>
                <h5>Les destination   </h5>
                <p> plus de ${stat3} KO destination publier dans notre site </p>
              </div>
            </div>
            <div class="col-sm-12 col-lg-6 mypadinginscrit">
              <div class="container mytxt">
                <img src="static/img/Graphicloads-Colorful-Long-Shadow-Hand-thumbs-up-like.ico" width="150px">
                <br> <br>
                <h5> Qui a aimer nous </h5>
                <p>plus de ${stat4} KO ont aimé nos service</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <a class="carousel-control-prev" href="#carouselExampleControls2" role="button" data-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carouselExampleControls2" role="button" data-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>



</section>

<section class="wow fadeInUp" data-wow-delay="0.3s" style="visibility: visible" >
  <c:import url="footer.jsp"/>
</section>



<c:if test="${message==true}">
  <script>
      $(document).ready(function () {
          swal("Ooops!", "Le nom d'utilisateur ou le mot de passe sont incorrecte !", "error");
      })
  </script>
</c:if>






<!-- script pour la date minimale -->
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

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js" ></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js" ></script>

<!--speciale pour importer le google map api -->
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
<script> new WOW().init(); </script>
</body>
</html>
