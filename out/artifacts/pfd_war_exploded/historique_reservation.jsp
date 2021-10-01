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

    <title>Historique reservation</title>
</head>
<body>

<nav>
    <c:import url="nav_membre.jsp"/>
</nav>

<section id="h_reservation">
    <div class="container mytxt">
        <h5>Historique des reservation</h5>
        <p>Consultez vos ancienne reservation et evaluez le chauffeur qui a publieé ce trajet. </p>
    </div>
    <br>
    <div class="contaner">
        <div class="row">
            <div class="col-sm-12 col-md-6 col-lg-4">
                <input type="text" id="chercher_reservation" class="form-control" placeholder="Rechercher .....">
            </div>
        </div>
        <br>
        <div class="table-responsive">
            <table class="table">
                <thead>
                <tr class="bg-warning">
                    <th scope="col">#</th>
                    <th scope="col"></th>
                    <th scope="col">Id_conducteur</th>
                    <th scope="col">Id_reservation</th>
                    <th scope="col">Ville de depart</th>
                    <th scope="col">Ville d'arriver</th>
                    <th scope="col">Date de reservation</th>
                </tr>
                </thead>
                <tbody id="maTable_histo">
                <c:forEach items="${liste_reservation}" var="reservation" varStatus="status">
                    <tr>
                        <th scope="row">${status.count}</th>
                        <c:forEach items="${liste_conducteur}" var="membre" begin="${status.count-1}" end="${status.count-1}">
                            <td>
                                <a href="<c:url value="/EvaluationConducteur">
                                            <c:param name="id_conducteur" value="${membre.nom_utilisateur}"/>
                                            <c:param name="id_membre" value="${id_membre}"/>
                                        </c:url>" style="padding-left:5%">
                                    <img src="static/img/icons8_Rating_23px.png">
                                </a>
                            </td>
                            <td>${membre.nom_utilisateur}</td>
                        </c:forEach>
                        <td>${reservation.id_reservation}</td>
                        <c:forEach items="${liste_trajet}" var="trajet" begin="${status.count-1}" end="${status.count-1}">
                            <td>${trajet.v_depart}</td>
                            <td>${trajet.v_arriver}</td>
                        </c:forEach>
                        <td>${reservation.date_reservation}</td>
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
        $("#chercher_reservation").on("keyup", function() {
            var value = $(this).val().toLowerCase();
            $("#maTable_histo tr").filter(function() {
                $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
            });
        });
    });

</script>
</body>
</html>