<!doctype html>
<html lang="Fr">

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

    <title>Supprimer Reservation</title>
</head>
<body>

<nav class="navbar sticky-top navbar-expand-lg navbar-dark bg-dark " >
    <a class="navbar-brand" href="profile_admin.jsp">
        <img src="static/img/logo.png" style="width:60px;">
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse mypading  " id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto ">

        </ul>
        <a href="<c:url value="/Acceuil"></c:url>" class="btn btn-md  btn-danger">Se deconnecter</a>
    </div>
</nav>


<section id="evalue_voyageur">

    <br>
    <div class="container">
        <div class="row">
           <c:forEach items="${liste_voyageur}" var="voyageur" varStatus="status">
                <div class="col-sm-12 col-md-6 col-lg-3">
                    <div class="card border-info" style="max-width: 100%;">
                        <img class="card-img-top" src="${voyageur.image}" alt="Card image cap">
                        <div class="card-body">
                            <h5 class="card-title">
                                ${voyageur.nom_utilisateur}
                            </h5>
                            <p class="card-text">
                                Nom: ${voyageur.nom} <br>
                                Prenom: ${voyageur.prenom} <br>
                                Telephone: ${voyageur.num_tel} <br>
                            </p>
                        </div>
                        <div class="card-footer">
                            <form action="Reservation" method="post">
                                <c:forEach items="${complement_reservation}" var="reservation" begin="${status.count-1}" end="${status.count-1}">
                                    <input type="hidden" name="id_reservation" value="${reservation.id_reservation}"><br>
                                </c:forEach>
                                <button type="submit" class="btn btn-md btn-warning">Supprimer reservation</button>
                            </form>
                        </div>
                    </div>
                </div>
            </c:forEach>

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
</body>
</html>