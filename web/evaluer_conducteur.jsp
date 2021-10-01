<!doctype html>
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
    <!-- Mon fichier de  CSS -->
    <link rel="stylesheet" href="static/css/mycss1.css">
    <link rel="stylesheet" href="static/css/mycss.css">

    <title>Evaluation du conducteur</title>
</head>
<body>

<nav>
    <c:import url="nav_membre.jsp"/>
</nav>

<section id="evalue_conducteur">
    <div class="container mytxt">
        <h5>Evaluer conducteur</h5>
        <p>Donneez une note à un conducteur consernant son conportement,ses capaciter de conduite et le respet des régles de covoiturage </p>
    </div>
    <br>
    <div class="container">
        <div class="row">
            <div class="col-sm-12 col-md-12 col-lg-6">
                <div class="card" style="max-width: 100%;">
                    <img class="card-img-top" src="static/img/driver2.png" alt="Card image cap">
                    <div class="card-body">
                        <h5 class="card-title">${conducteur.nom_utilisateur}</h5>
                        <p class="card-text">
                           Nom: ${conducteur.nom} <br>
                           Prenom: ${conducteur.prenom} <br>
                           Telephone: ${conducteur.num_tel} <br>
                        </p>
                    </div>
                    <div class="card-footer">
                        Note: ${conducteur.note}
                    </div>
                </div>
            </div>
            <div class="col-sm-12 col-md-12 col-lg-6">
                <br><br><br>
                <form action="EvaluationConducteur" method="post">
                    <div class="form-group">
                        <label for="note">La note de conducteur :</label>
                        <br>
                        <input type="hidden" name="examinateur" value="${id_membre}">
                        <input type="hidden" name="conducteur" value="${conducteur.nom_utilisateur}">
                        <input type="hidden" name="note" value="" id="note"/><br>
                        <img src="static/img/star_clear.gif" id="clear_stars">
                        <img src="static/img/star_out.png" id="star_1" class="star"/>
                        <img src="static/img/star_out.png" id="star_2" class="star"/>
                        <img src="static/img/star_out.png" id="star_3" class="star"/>
                        <img src="static/img/star_out.png" id="star_4" class="star"/>
                        <img src="static/img/star_out.png" id="star_5" class="star"/>
                    </div>
                    <button type="submit" class="btn btn-success" style="margin-left: 11%">Noter</button>
                </form>
            </div>
        </div>
    </div>

</section>
<section>
    <c:import url="footer.jsp"/>

</section>



<!--partie speciale pour la fonction et jquery de evaluation par etoile-->
<script type="text/javascript" src="static/js/jquery.js"></script>
<script type="text/javascript" src="static/js/fonctions.js"></script>

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