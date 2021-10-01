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

    <style>

        .grandBlocnote
        {
            display: flex;
            justify-content: flex-end;
            align-items: center;
            margin-bottom: 50px;
            width: 507px;
            height: 100px;
            margin: 0 auto 1em;
            font-size: 45px;
            background-color: rgba(255,255,255,0.5);
        }

        .grandBlocnote div
        {
            float:right;
            color: #4C91D8;
            text-decoration: none;
            -webkit-transition: color .4s;
            -moz-transition: color .4s;
            -o-transition: color .4s;
            transition: color .4s;
        }

        .grandBlocnote div:hover,
        .grandBlocnote div:hover ~ div,
        .grandBlocnote div:focus,
        .grandBlocnote div:focus ~ div
        {
            color: orange;
            cursor: pointer;
        }

        .grandBlocnote
        {
            direction: rtl;
        }

        .grandBlocnote div
        {
            float:none
        }



    </style>

    <title>Evaluer Voyageur</title>

</head>
<body>

<nav>
    <c:import url="nav_membre.jsp"/>
</nav>


<section id="evalue_voyageur">
    <div class="container mytxt">
        <h5>Evaluer voyageurs</h5>
        <p>Evaluez les voyageurs qui ont participé à votre covoiturage.</p>
    </div>
    <br>
    <div class="container">
        <div class="row">
            <c:forEach items="${liste_voyageur}" var="voyageur" varStatus="statut">
                <div class="col-sm-12 col-md-12 col-lg-3">
                    <div class="card border-info" style="max-width: 100%;">
                        <img class="card-img-top" src="${voyageur.image}" alt="Card image cap">
                        <div class="card-body">
                            <h5 class="card-title">${voyageur.nom_utilisateur}</h5>
                            <p class="card-text">
                                Nom: ${voyageur.nom} <br>
                                Prenom: ${voyageur.prenom} <br>
                                Telephone: ${voyageur.num_tel} <br>
                            </p>
                            <form action="EvaluationVoyageur" method="post" id="form${statut.count}">
                                <div class="form-group">
                                    <label >Noter le voyageur :</label>
                                    <br>
                                    <input type="hidden" name="examinateur" value="${id_membre}">
                                    <input type="hidden" name="voyageur" value="${voyageur.nom_utilisateur}">
                                    <input type="hidden" name="note" value="" id="note${statut.count}"/>
                                    <div class = 'grandBlocnote' >
                                        <div onclick="valeur(5,${statut.count})">★</div>
                                        <div onclick="valeur(4,${statut.count})">★</div>
                                        <div onclick="valeur(3,${statut.count})">★</div>
                                        <div onclick="valeur(2,${statut.count})">★</div>
                                        <div onclick="valeur(1,${statut.count})">★</div>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="card-footer">
                            Note: ${voyageur.note}
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

</section>













<section>
    <c:import url="footer.jsp"/>

</section>













<!--partie speciale pour la fonction  evaluation par etoile-->
<script>

    function valeur(note,id){
        $('#note'+id).attr({value:note}) ;
        document.getElementById('form'+id).submit() ;
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
<script>
    $(function () {
        $('[data-toggle="popover"]').popover()
    })

</script>
</body>
</html>