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
                <form action="Oublier" method="post">
                    <input type="hidden" id="cache_code" value="${code_confirmation}">

                    <div class="form-group">
                        <label for="mem">Adresse Email (ou numero de telephone) :</label>
                        <input type="text" class="form-control" id="mem" name="membre" placeholder="Entrez votre idantifiant">
                    </div>

                    <div class="form-group">
                        <label for="code">Code de confirmation :</label>
                        <input type="text" class="form-control" id="code" placeholder="Entrez le code texto" onchange="verefie_col()">
                    </div>
                    <div class="form-group">
                        <label for="pass">Nouveau mot de passe :</label>
                        <input type="password" class="form-control" id="pass" name="mot_passe" placeholder="Entrez le mot de passe">
                        <small id="passwordHelpBlock" class="form-text text-muted">
                            Your password must be 8-20 characters long, contain letters and numbers, and must not contain spaces, special characters, or emoji.
                        </small>
                    </div>
                    <div class="form-group">
                        <label for="c_pass">Confirmer le mot de passe :</label>
                        <input type="password" class="form-control" id="c_pass" placeholder="Entrez à nouveau le mot de passe" onchange="verefie()">
                    </div>
                    <br>
                    <button type="submit" id="envoyer" class="btn btn-success" disabled>Confirmer</button>
                </form>
            </div>
        </div>
    </div>

</section>





<section >
    <c:import url="footer.jsp"/>
</section>


<script>

    function verefie_col(){
        if(document.getElementById('code').value!=document.getElementById('cache_code').value){
            document.getElementById('code').style.borderColor="red" ;
        }
        else{
            document.getElementById('code').style.borderColor="green" ;
        }
    }

    function verefie(){
        if (document.getElementById('code').value==document.getElementById('cache_code').value && document.getElementById('pass').value==document.getElementById('c_pass').value){

            document.getElementById('envoyer').disabled=false ;
        }
        else{
            alert("Veuilez verefier les données entrez !")
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
