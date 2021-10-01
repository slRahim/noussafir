<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="static/css/bootstrap.min.css">
    <!-- Material Design Bootstrap -->
    <link href="static/css/mdb.min.css" rel="stylesheet">
    <!-- Mon fichier de  CSS -->
    <link rel="stylesheet" href="static/css/mycss.css">
    <title>Inscription</title>
</head>
<body>


<nav class="navbar sticky-top navbar-expand-lg navbar-dark bg-dark " >
    <a class="navbar-brand" href="page_inscription.jsp">
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

<section id="form-inscrit" class="mytxt ">
    <div class="container">
        <h4>Inscription</h4>
        <p>Avec notre solution de covoiturage vous pouvez avec un seul compte de publier et suivre vos trajets et aussi de reserver dans des covoiturages.Inscrivez dés maitenant GO...GO</p>
    </div>
    <br> <br>

    <div class="card text-dark bg-light mb-3" style="max-width: 100%;">
        <div class="card-body">
            <form action="NouveauClient" method="post" enctype="multipart/form-data">
                <div class="form-group row">
                    <label for="nomutil" class="col-sm-2 col-form-label">Nom utilisateur:</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="nomutil" name="nom_utilisateur" placeholder="nom d'utilisateur">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="mail" class="col-sm-2 col-form-label">Adresse Email:</label>
                    <div class="col-sm-6">
                        <input type="email" class="form-control" id="mail" name="id_email" placeholder="Email">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="motdpass" class="col-sm-2 col-form-label">Mot de passe: </label>
                    <div class="col-sm-6">
                        <input type="password" id="motdpass" name="motdpass" class="form-control" aria-describedby="passwordHelpBlock" placeholder="password">
                        <small id="passwordHelpBlock" class="form-text text-muted">
                            Your password must be 8-20 characters long, contain letters and numbers, and must not contain spaces, special characters, or emoji.
                        </small>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="nom" class="col-sm-2 col-form-label">Nom:</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="nom" name="nom_client" placeholder="votre nom">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="prenom" class="col-sm-2 col-form-label">Prenom:</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="prenom" name="prenom_client" placeholder="votre prenom">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="dat" class="col-sm-2 col-form-label">Date de naissance:</label>
                    <div class="col-sm-6">
                        <input type="date" class="form-control" id="dat" name="date_client">
                    </div>
                </div>
                <br>
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">Sex: </label>
                    <div class=" col-sm-2 custom-control custom-radio custom-control-inline">
                        <input type="radio" id="customRadioInline1" name="customRadioInline1" class="custom-control-input">
                        <label class="custom-control-label" for="customRadioInline1">Homme</label>
                    </div>
                    <div class="custom-control custom-radio custom-control-inline">
                        <input type="radio" id="customRadioInline2" name="customRadioInline1" class="custom-control-input">
                        <label class="custom-control-label" for="customRadioInline2">Femme</label>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="adresse" class="col-sm-2 col-form-label">Adresse :</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="adresse" name="adresse" placeholder="Adresse">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="tel" class="col-sm-2 col-form-label">Numero de Tel:</label>
                    <div class="col-sm-6">
                        <input type="tel" class="form-control" id="tel" name="tel_client">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="tel" class="col-sm-2 col-form-label">Photo de profile :</label>
                    <div class="col-sm-6">
                        <input type="file" id="photo" name="photo" placeholder="Charger une image">
                    </div>
                </div>
                <div class="form-group row">
                    <label  class="col-sm-2 col-form-label"></label>
                    <div class="col-sm-2">
                        <div class="custom-control custom-checkbox my-1 mr-sm-2">
                            <input type="checkbox" class="custom-control-input" id="verefie" onclick="inscr()">
                            <label class="custom-control-label" for="verefie">Verefie moi! </label>
                        </div>
                    </div>
                </div>
                <br>
                <div class="form-group row">
                    <div class="col-9">
                        <button type="submit" id="ok" class="btn btn-warning" disabled>Sinscrire</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

</section>


<section>
    <c:import url="footer.jsp"/>

</section>


<c:if test="${etat==0}">
    <script>
        $(document).ready(function () {
            swal("Ooops!", "Ce compte existe déja si vous avez oublier votre mot de passe passez par mot de passe oublier !", "error");
        })
    </script>
</c:if>


<script>

    function inscr() {
        if (document.getElementById('nomutil').value!='' && document.getElementById('mail').value!='' && document.getElementById('motdpass').value!='' &&
            document.getElementById('nom').value!='' && document.getElementById('dat').value!='' && document.getElementById('tel').value!='' ){

            document.getElementById('ok').disabled=false;
        }
        else {
            swal("Ooops!", "Veullez remplir le minimum des champs SVP !", "error");
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
</body>
</html>