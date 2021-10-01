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

    <title>Historique des trajets</title>
</head>
<body>

<nav>
    <c:import url="nav_membre.jsp"/>
</nav>

<section id="h_trajet">
    <div class="container mytxt">
        <h5>Historique des trajets</h5>
        <p> Consultez vos ancien trajets et evaluez les voyageurs qui ont participé dans ce trajet.</p>
    </div>
    <br>
    <div class="contaner">
        <div class="row">
            <div class="col-sm-12 col-md-6 col-lg-4">
                <input type="text" id="chercher" class="form-control" placeholder="Rechercher .....">
            </div>
        </div>
        <br>
        <div class="table-responsive">
            <table class="table">
                <thead>
                <tr class="bg-warning">
                    <th scope="col">#</th>
                    <th scope="col"></th>
                    <th scope="col">Id_trajet</th>
                    <th scope="col">Ville de depart</th>
                    <th scope="col">Ville d'arriver</th>
                    <th scope="col">Date de publication</th>
                </tr>
                </thead>
                <tbody id="maTable_historique">
                <c:forEach items="${liste_trajet}" var="trajet" varStatus="status">
                    <tr>
                        <th scope="row">${status.count}</th>
                        <td>
                            <a href="<c:url value="/EvaluationVoyageur">
                                        <c:param name="id_trajet" value="${trajet.id_trajet}"/>
                                        <c:param name="id_membre" value="${id_membre}"/>
                                     </c:url>" style="padding-left:5%">
                                <img src="static/img/icons8_Rating_23px.png">
                            </a>
                        </td>
                        <td>${trajet.id_trajet}</td>
                        <td>${trajet.v_depart}</td>
                        <td>${trajet.v_arriver}</td>
                        <td>${trajet.date_ajout}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</section>
<section>
    <c:import url="footer.jsp"/>

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
<script>
    $(function () {
        $('[data-toggle="popover"]').popover()
    })

</script>
<!-- la fonction de filtrage -->
<script >

    $(document).ready(function(){
        $("#chercher").on("keyup", function() {
            var value = $(this).val().toLowerCase();
            $("#maTable_historique tr").filter(function() {
                $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
            });
        });
    });

</script>
</body>
</html>