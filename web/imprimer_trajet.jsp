<!doctype html>
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
    <link rel="stylesheet" href="static/css/mycss1.css">
    <link rel="stylesheet" href="static/css/mycss.css">

    <title>Consulter trajet</title>
</head>
<body>
<br><br><br><br>
<div class="container">
    <div class="card text-dark bg-light mb-3" style="max-width: 80rem;">
        <div class="card-header">
            <h5>Fiche descriptif de trajet : ${trajet.id_trajet}</h5>
        </div>
        <div class="card-body">
            <form>
                <div class="form-group row">
                    <label for="start" class="col-sm-2 col-form-label">Ville de depart:</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="start" name="v_depart" value="${trajet.v_depart}" disabled>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="end" class="col-sm-2 col-form-label">Ville d'arriver:</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="end" name="v_arriver" value="${trajet.v_arriver}" disabled>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="ar1" class="col-sm-2 col-form-label">Arret n_1: </label>
                    <div class="col-sm-6">
                        <input type="text" id="ar1" name="arret_1" class="form-control" value="${trajet.arret_1}" disabled>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="ar2" class="col-sm-2 col-form-label">Arret n_2: </label>
                    <div class="col-sm-6">
                        <input type="text" id="ar2" name="arret_2" class="form-control" value="${trajet.arret_2}" disabled>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="ar3" class="col-sm-2 col-form-label">Arret n_3: </label>
                    <div class="col-sm-6">
                        <input type="text" id="ar3" name="arret_3" class="form-control" value="${trajet.arret_3}" disabled>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="d_depart" class="col-sm-2 col-form-label">Date de depart:</label>
                    <div class="col-sm-6">
                        <input type="date" class="form-control" id="d_depart" name="date_depart" value="${trajet.date_dapart}" disabled>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="h_depart" class="col-sm-2 col-form-label">Heur de depart: </label>
                    <div class="col-sm-6">
                        <input type="text" id="h_depart" name="h_depart" class="form-control" value="${trajet.h_depart}" disabled>
                    </div>
                </div>
                <br>
                <div class="form-group row">
                    <label for="des" class="col-sm-2 col-form-label">Description du trajet : </label>
                    <div class="col-sm-6">
                        <input type="text" id="des"  class="form-control" value="${trajet.description}" disabled>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="n_place" class="col-sm-2 col-form-label">Nombre de place:</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="n_place" name="n_place" value="${trajet.nombre_place}" disabled >
                    </div>
                </div>
                <div class="form-group row">
                    <label for="p_place" class="col-sm-2 col-form-label">Prix de la place:</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="p_place" name="p_place" value="${trajet.prix}" disabled>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <c:forEach items="${liste_reservation}" var="membre">
        <div class="contaner">
            <div class="card testimonial-card">
                <div class="card-header" style="background-color:#1dd1a1">
                </div>
                <hr>
                <div class="card-body">
                    <div class="row">
                        <div class="col-sm-12 col-md-4 col-lg-2">
                            <img src="${membre.image}" width="90%">
                            <br>
                        </div>
                        <div class="col-sm-12 col-md-4 col-lg-5">
                            <p><strong>Identifiant membre :</strong> ${membre.nom_utilisateur} </p>
                            <p><strong>Nom :</strong> ${membre.nom} </p>
                            <p><strong>Prenom :</strong> ${membre.prenom} </p>
                        </div>
                        <div class="col-sm-12 col-md-4 col-lg-5">
                            <p><strong> Adresee :</strong> ${membre.adresse} </p>
                            <p><strong>Numéro téléphone :</strong> ${membre.num_tel} </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br><br>
    </c:forEach>
    <br><br>
    <a href="javascript:window.print()" class="btn  btn-info">Imprimer</a>

</div>







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
