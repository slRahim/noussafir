<!doctype html>
<html lang="Fr">
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
    <link rel="stylesheet" href="static//css/mycss.css">

    <title>Acceuil</title>
</head>
<body>

<!-- la bare de navigation -->
<nav class="navbar sticky-top navbar-expand-lg navbar-dark bg-dark " >
    <a class="navbar-brand" href="">
        <img src="static/img/logo.png" style="width:60px;">
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse mypading  " id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto ">

        </ul>
        <a href="page_inscription.jsp" class="btn  btn-info">S'inscrire</a>
    </div>
</nav>

<section style="padding: 60px">
    <div class="container mytxt">
        <h5>Changer le mot de passe</h5>
        <p>Vous recevez un code de confirmation sur votre numéro de téléphone.Veuillez entrer ce code et le nouveau mot de passe </p>
    </div>
    <br>
    <div class="container">
        <div class="card text-dark bg-light mb-3" style="max-width: 40rem;">
            <div class="card-body">
                <form action="Oublier" method="get">
                    <div class="form-group">
                        <label for="tel">Nom utilisateur :</label>
                        <input type="tel" class="form-control" id="tel" name="num_tel" placeholder="Entrez le nom utilisateur" >
                    </div>
                    <div class="form-group">
                        <label for="mail">Adresse Email :</label>
                        <input type="email" class="form-control" id="mail" name="mail" placeholder="Entrez l'adresse email du compte" onclick="verefie_col()" >
                    </div>
                    <br>
                    <button type="submit" id="envoyer" class="btn btn-success"  disabled>Confirmer</button>
                </form>
            </div>
        </div>
    </div>

</section>





<section >
    <c:import url="footer.jsp"/>
</section>


<script>
    function verefie_col() {
        if (document.getElementById('tel').value!="" || document.getElementById('mail').value!=""){

            document.getElementById('envoyer').disabled=false ;
        }

    }
</script>



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
