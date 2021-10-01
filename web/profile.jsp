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

    <title>Profile</title>
</head>
<body>

<nav>
    <c:import url="nav_membre.jsp"/>
</nav>



<section id="profile">

    <div class="container , mytxt">
        <h4>Modifier profile</h4>
        <p>Consultez et modifiez vos informations personnel et votre photo de profile. </p>
    </div>
    <br> <br>
    <div class="container">
        <div class="row">
            <div class="col-sm-12 col-md-12 col-lg-4">
                <div class="card border-info" style="max-width: 100%;">
                    <img class="card-img-top" src="${profile.image}" alt="Card image cap">
                    <div class="card-body">
                        <h5 class="card-title">Bonjour</h5>
                        <p class="card-text">
                            La suppression de votre compte provoque l'effacement de tous vos information et les anciens publication.
                            il faut que vous utilisez cette option prudament,Merci.
                        </p>
                        <br> <br>
                        <a href="<c:url value="/SupprimerProfile"><c:param name="id_membre" value="${profile.nom_utilisateur}"/> </c:url>" class="btn btn-danger" onclick="return(confirm('Voullez vous vraiment supprimer votre compte defenitivement ?'))">Supprimer compte</a>
                    </div>
                    <div class="card-footer">
                        <form  action="ModifiePhoto" method="post" enctype="multipart/form-data">
                            <div class="container">
                                <input type="hidden" name="id_membre" value="${profile.nom_utilisateur}">
                                <label>Modifie photo de profile :</label>
                                <input type="file" name="photo" id="photo" class="form-control input-sm"><br>
                                <button type="submit" id="envoyer" class="btn btn-success" >valider</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <div class="col-sm-12 col-md-12 col-lg-8">
                <br> <br>
                <form action="ModifieProfile" method="post" enctype="multipart/form-data">
                    <div class="form-group row">
                        <label for="nomutil" class="col-sm-2 col-form-label">Nom utilisateur:</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="nomutil" name="nom_utilisateur" value="${profile.nom_utilisateur}" readonly>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="mail" class="col-sm-2 col-form-label">Adresse Email:</label>
                        <div class="col-sm-6">
                            <input type="email" class="form-control" id="mail" name="id_email"  value="${compte.id_email}">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="motdpass" class="col-sm-2 col-form-label">Mot de passe: </label>
                        <div class="col-sm-6">
                            <input type="password" id="motdpass" name="motdpass" class="form-control" aria-describedby="passwordHelpBlock"  value="${compte.mot_de_passe}">
                            <small id="passwordHelpBlock" class="form-text text-muted">
                                Your password must be 8-20 characters long, contain letters and numbers, and must not contain spaces, special characters, or emoji.
                            </small>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="nom" class="col-sm-2 col-form-label">Nom:</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="nom" name="nom_client" value="${profile.nom}">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="prenom" class="col-sm-2 col-form-label">Prenom:</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="prenom" name="prenom_client"  value="${profile.prenom}">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="dat" class="col-sm-2 col-form-label">Date de naissance:</label>
                        <div class="col-sm-6">
                            <input type="date" class="form-control" id="dat" name="date_client"  value="${profile.date_naissance}">
                        </div>
                    </div>
                    <br>

                    <div class="form-group row">
                        <label for="adresse" class="col-sm-2 col-form-label">Adresse :</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="adresse" name="adresse"  value="${profile.adresse}">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="tel" class="col-sm-2 col-form-label">Numero de Tel:</label>
                        <div class="col-sm-6">
                            <input type="tel" class="form-control" id="tel" name="tel_client"  value="${profile.num_tel}">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label  class="col-sm-2 col-form-label"></label>
                        <div class="col-sm-2">
                            <div class="custom-control custom-checkbox my-1 mr-sm-2">
                                <input type="checkbox" class="custom-control-input" id="verefie" onclick="v_modifie()">
                                <label class="custom-control-label" for="verefie" >Verefie moi! </label>
                            </div>
                        </div>
                    </div>

                    <br><br>
                    <div class="form-group row">
                        <div style="padding-left: 18%">
                            <button type="submit" id="ok" class="btn btn-warning" disabled  onclick="return(confirm('Vous confirmez ces modification ?'))">Appliquer</button>
                        </div>
                    </div>
                </form>

            </div>
        </div>

    </div>

</section>

<section>
    <c:import url="footer.jsp"/>

</section>


<script>

    function v_modifie() {

        if(document.getElementById('mail').value!='' && document.getElementById('motdpass').value!=''){

            document.getElementById('ok').disabled=false;
        }
        else {
            swal("Ooops!", "les champs mot de passe et email sont obligatoire !", "info");
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