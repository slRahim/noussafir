<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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

    <title>Voyageur</title>
</head>
<body>

<nav>
    <c:import url="nav_membre.jsp"/>
</nav>


<nav>
    <div class="nav nav-tabs" id="nav-tab" role="tablist">
        <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">Acceuil</a>
        <a class="nav-item nav-link" id="nav-reservation-tab" data-toggle="tab" href="#nav-reservation" role="tab" aria-controls="nav-reservation" aria-selected="false">Suivre mes reservations</a>
    </div>
</nav>

<div class="tab-content" id="nav-tabContent">

    <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="home-tab">

        <section id="recherche_voyageur" class="mytxtblanc parallax">
            <br><br><br>
            <div class="container">
                <div class="container" style="text-align: center">
                    <h5>Rechercher une destination </h5>
                    <p> Entrez une ville de depart et une ville d'arriver et nous faisons le reste avec notre moteur de recherche vous trouvez surement un covoiturage.</p>
                </div>
                <br>
                <!-- le formullaire de la recherche d'une destiantion-->

                <div class="container" >
                    <div class="row">
                        <div class="col-sm-12 col-md-12 col-lg-6 mypadinginscrit ">
                            <form action="RechercheTrajet" method="post">
                                <input type="hidden" name="id_membre" value="${id_membre}">
                                <div class="form-group">
                                    <label for="start">Ville de depart :</label>
                                    <input type="text" class="form-control" id="start" name="ville_depart"  placeholder="Ville de depart">
                                </div>
                                <div class="form-group">
                                    <label for="end">Ville d'arriver :</label>
                                    <input type="text" class="form-control" id="end" name="ville_arriver" placeholder="Ville d'arriver">
                                </div>
                                <div class="form-group">
                                    <label for="dateD">Date de depart :</label>
                                    <input type="date" class="form-control" id="dateD" name="date_depart" placeholder="Date de depart">
                                </div>
                                <br>
                                <button id="get" type="submit" class="btn btn-danger btn-md" >Rechercher</button>
                            </form>

                        </div>
                        <div class="col-sm-12 col-md-12 col-lg-6 mypadinginscrit">
                            <div id="map"></div>
                            <!-- place reserver pour la carte gps de google -->
                        </div>
                    </div>
                </div>
            </div>


        </section>

        <section id="resultat_recherche">
            <div class="container mytxt">
                <h5>Resultat de recherche </h5>
                <br> <br>
                <c:if test="${fn:length(liste_trajet)<=0}">
                    <div class="row">
                        <c:forEach items="${tout_trajet}" var="trajet">
                            <div class="col-sm-12 col-md-12 col-lg-4">
                                <div class="card mb-3" style="width: 100%;">
                                    <div class="card-body">
                                        <h5 class="card-title">Id_trajet :${trajet.id_trajet}</h5>
                                        <p class="card-text">
                                            Depart : ${trajet.v_depart} <br>
                                            Arriver : ${trajet.v_arriver} <br>
                                            Date depart : ${trajet.date_dapart} <br>
                                            Nombre de place : ${trajet.nombre_place} <br>
                                            Prix : ${trajet.prix}
                                        </p>
                                    </div>
                                    <div class="card-footer">
                                        <a href="<c:url value="/NouvelleReservation"><c:param name="id_trajet" value="${trajet.id_trajet}"/>
                                                            <c:param name="id_membre" value="${id_membre}"/>
                                                 </c:url>" class="btn btn-primary" onclick="return(confirm('Voullez vous reserver dans ce trajet ?'))">Reserver</a>
                                        <a href="<c:url value="/ConsulterTrajet"><c:param name="id_trajet" value="${trajet.id_trajet}"/></c:url>" target="_blank"><img src="static/img/icons8_Opera_Glasses_30px.png"></a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:if>
            </div>
            <br>
            <!-- le resultat de recherche en carte avec jstl-->
            <div class="container">
                <div class="row">
                    <c:forEach items="${liste_trajet}" var="trajet">
                        <div class="col-sm-12 col-md-12 col-lg-4">
                            <div class="card bg-light mb-3" style="width: 100%;">
                                <div class="card-body">
                                    <h5 class="card-title">Id_trajet :${trajet.id_trajet}</h5>
                                    <p class="card-text">
                                        Depart : ${trajet.v_depart} <br>
                                        Arriver : ${trajet.v_arriver} <br>
                                        Date depart : ${trajet.date_dapart} <br>
                                        Heur depart : ${trajet.h_depart}<br>
                                        Nombre de place : ${trajet.nombre_place} <br>
                                        Prix : ${trajet.prix} DA
                                    </p>
                                </div>
                                <div class="card-footer">
                                    <a href="<c:url value="/NouvelleReservation"><c:param name="id_trajet" value="${trajet.id_trajet}"/>
                                                        <c:param name="id_membre" value="${id_membre}"/>
                                             </c:url>" class="btn btn-primary" onclick="return(confirm('Voullez vous reserver dans ce trajet ?'))">Reserver</a>
                                    <a href="<c:url value="/ConsulterTrajet"><c:param name="id_trajet" value="${trajet.id_trajet}"/></c:url>" target="_blank"><img src="static/img/icons8_Opera_Glasses_30px.png"></a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>

        </section>

    </div>

    <div class="tab-pane fade" id="nav-reservation" role="tabpanel" aria-labelledby="reservation-tab">

        <section id="mes_reservation">
            <div class="container mytxt">
                <h5>Suiver mes reservations</h5>
                <p> Consultez vos reservation en cours et faites un suivie; imprimer reservation,payer une reservation et meme annuler si vous voullez.</p>
            </div>
            <br>

            <div class="contaner">
                <a href="<c:url value="/HistoriqueReservation"><c:param name="id_membre" value="${id_membre}"/></c:url>" class="d-flex justify-content-end">Consuletr l'historique de reservation </a>
                <br><br>
                <c:forEach items="${liste_reservation}" var="reservation" varStatus="status">
                    <div class="card testimonial-card" style="max-width: 100%">
                        <div class="card-header" style="background-color:#ff6b6b">
                        </div>
                        <div class="card-body">
                            <h4>Identifiant du rservation : ${reservation.id_reservation} </h4>
                            <h4 class="card-title d-flex justify-content-end">
                                <div class="row">
                                    <c:if test="${reservation.etat!='annulé'}">
                                        <a href="<c:url value="/AnnulerReservation">
                                                    <c:param name="id_reservation"  value="${reservation.id_reservation}"/>
                                                    <c:param name="id_membre" value="${id_membre}"/>
                                                  </c:url>" style="padding-left:5%" onclick="return(confirm('Voullez cette reservation ?'))">
                                            <img src="static/img/icons8_Cancel_23px_1.png" style="margin-right: 2%">
                                        </a>
                                        <c:if test="${reservation.etat=='valider'}">
                                            <a href="<c:url value="/Payer"><c:param name="id_reservation" value="${reservation.id_reservation}"/></c:url>" style="padding-left:5%">
                                                <img src="static/img/icons8_Card_Payment_23px.png" style="margin-right: 2%">
                                            </a>
                                            <a href="<c:url value="/ImprimerReservation"><c:param name="id_reservation" value="${reservation.id_reservation}"/></c:url>" target="_blank" style="padding-left:5%">
                                                <img src="static/img/icons8_Print_23px_2.png" style="margin-right: 2%">
                                            </a>
                                        </c:if>
                                    </c:if>
                                </div>
                            </h4>
                            <hr>
                            <div class="row">
                                <div class="col">
                                   <c:forEach items="${list_trajet}" var="trajet" begin="${status.count-1}" end="${status.count-1}">
                                       <p><strong>Ville de depart :</strong> ${trajet.v_depart} </p>
                                       <p><strong>Ville d'arriver :</strong> ${trajet.v_arriver} </p>
                                       <p><strong>Date de depart :</strong> ${trajet.date_dapart} </p>
                                   </c:forEach>
                                </div>
                                <div class="col">
                                    <p><strong> Date de reservation :</strong> ${reservation.date_reservation}</p>
                                    <p><strong>Etat :</strong> ${reservation.etat} </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br><br>
               </c:forEach>
            </div>
        </section>

    </div>

</div>


<section>
    <c:import url="footer.jsp"/>

</section>








<!-- script de la date minimale-->
<script>

    var today = new Date();
    var dd = today.getDate();
    var mm = today.getMonth()+1; //January is 0!
    var yyyy = today.getFullYear();
    if(dd<10){
        dd='0'+dd
    }
    if(mm<10){
        mm='0'+mm
    }

    today = yyyy+'-'+mm+'-'+dd;
    document.getElementById("dateD").setAttribute("min", today);

</script>


<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyArft1j_q20ao97RVTqcXeKdQoIzXUwFlA&libraries=places&callback=initMap"
        async defer></script>
<script src="static/js/script_map.js"></script>

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