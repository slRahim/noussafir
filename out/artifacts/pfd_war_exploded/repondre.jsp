<!DOCTYPE html>
<html lang="en">

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

    <link href="static/css/mycss1.css" rel="stylesheet">
    <title>Repondre</title>
</head>
<body>

<nav class="navbar sticky-top navbar-expand-lg navbar-dark bg-dark " >
    <a class="navbar-brand" href="page_mode_utilisateur.jsp">
        <img src="static/img/logo.png" style="width:60px;">
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar3" aria-controls="navbar3" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div id="navbar3" class="collapse navbar-collapse mypading" >
        <ul class="navbar-nav mr-auto ">

        </ul>
        <a href="<c:url value="/Acceuil"></c:url>" class="btn btn-md  btn-danger" style="margin-left: 2%">se deconnecter</a>
    </div>
</nav>



<br><br><br><br>

<div class="container">
    <div class="row">
        <div class="col-sm-12 col-md-12 col-lg-6">
            <div class="card mb-3">
                <div class="card-body ">
                    <form  action="Repondre" method="post">
                        <div class="md-form">
                            <input type="email" id="materialFormContactEmailEx" class="form-control" name="emmeteur" value="${message.emmeteur}" readonly>
                        </div>
                        <div class="md-form">
                            <input type="text" id="materialFormContactSubjectEx1" class="form-control">
                            <label for="materialFormContactSubjectEx1">Sujet</label>
                        </div>
                        <div class="md-form">
                            <textarea type="text" id="materialFormContactMessageEx2" name="contenu" class="form-control md-textarea" rows="3"></textarea>
                            <label for="materialFormContactMessageEx2">Réponse</label>
                        </div>
                        <div class="mt-4">
                            <button class="btn btn-secondary" type="submit">Envoyer</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="col-sm-12 col-md-12 col-lg-6">
            <br><br>
            <div class="card mb-3" >
                <div class="card-body ">
                    <div class="md-form">
                        <input type="text"  class="form-control" value="Reclamation" disabled>
                    </div>
                    <div class="md-form">
                        <textarea type="text" class="form-control md-textarea" rows="3" readonly>${message.contenu}</textarea>
                    </div>
                </div>
            </div>
        </div>
    </div>



</div>

<br><br>
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
</body>
</html>