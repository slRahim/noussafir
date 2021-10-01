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

    <title>Conducteur</title>
</head>
<body>

<nav>
    <c:import url="nav_membre.jsp"/>
</nav>


<nav >
    <div class="nav nav-tabs" id="nav-tab" role="tablist">
        <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">Acceuil</a>
        <a class="nav-item nav-link" id="nav-publier-tab" data-toggle="tab" href="#nav-publier" role="tab" aria-controls="nav-publier" aria-selected="false">Publier trajet</a>
        <a class="nav-item nav-link" id="nav-demande-tab" data-toggle="tab" href="#nav-demande" role="tab" aria-controls="nav-demande" aria-selected="false">Demande reservation</a>
    </div>
</nav>

<div class="tab-content" id="nav-tabContent">

    <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">

        <section id="mes_trajet">
            <div class="container mytxt">
                <h5>Suiver mes trajets</h5>
                <p>Consultez vos trajet deja publier et faites un suivie pour eux, modifier,supprimer et meme imprimer un trajet.  </p>
            </div>
            <br>

            <div class="contaner">
                <a href="<c:url value="/HistoriqueTrajet"><c:param name="id_membre" value="${id_membre}"/></c:url>" class="d-flex justify-content-end">Consuletr historique trajet</a>
                <br><br>
                <c:forEach items="${liste_trajet}" var="trajet" varStatus="status">
                    <div class="card testimonial-card" style="max-width: 100%">
                        <div class="card-header" style="background-color: #00d2d3">
                        </div>
                        <div class="card-body" >
                            <h4>Identifiant du trajet :${trajet.id_trajet} </h4>
                            <h4 class="card-title d-flex justify-content-end" >
                                <div class="row">
                                    <a href="<c:url value="/ModifieTrajet"><c:param name="id_trajet" value="${trajet.id_trajet}"/><c:param name="id_membre" value="${id_membre}"/></c:url>" style="padding-left:5%">
                                        <img src="static/img/icons8_Edit_File_25px.png">
                                    </a>
                                    <a href="<c:url value="/SupprimerTrajet"><c:param name="id_trajet" value="${trajet.id_trajet}"/><c:param name="id_membre" value="${id_membre}"/></c:url>" style="padding-left:5%" onclick="return(confirm('Voullez vous supprimer ce trajet ?'))">
                                        <img src="static/img/icons8_Trash_25px.png" >
                                    </a>
                                    <a href="<c:url value="/ConsulterTrajet"><c:param name="id_trajet" value="${trajet.id_trajet}"/></c:url>" target="_blank" style="padding-left:5%">
                                        <img src="static/img/icons8_Print_23px_2.png">
                                    </a>
                                </div>
                            </h4>
                            <hr>
                            <div class="row">
                                <div class="col">
                                    <p><strong>Ville de depart :</strong> ${trajet.v_depart}</p>
                                    <p><strong>Ville d'arriver :</strong> ${trajet.v_arriver}</p>
                                </div>
                                <div class="col">
                                    <p><strong>Date de publication :</strong> ${trajet.date_ajout}</p>
                                    <p><strong>Prix de place :</strong> ${trajet.prix}</p>
                                </div>
                            </div>
                        </div>

                    </div>
                    <br><br>
                </c:forEach>

            </div>
        </section>

    </div>

    <div class="tab-pane fade" id="nav-publier" role="tabpanel" aria-labelledby="nav-publier-tab">

        <section id="form-inscrit" class="mytxt ">
            <div class="container">
                <h4>Publier trajet </h4>
                <p>Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l'imprimerie depuis les années 1500, quand un peintre anonyme assembla ensemble des morceaux de</p>
            </div>
            <br> <br>
            <div class="container">
                <div id="map"></div>
                <div class="card text-dark bg-light mb-3" style="max-width: 100%;">
                    <div class="card-body">
                        <form action="Trajet" method="post">
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label"></label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control"  name="id_membre" value="${id_membre}" hidden>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="start" class="col-sm-2 col-form-label">Ville de depart:</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" id="start" name="v_depart" placeholder="Ville de depart">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="ar1" class="col-sm-2 col-form-label">Arret n_1: </label>
                                <div class="col-sm-6">
                                    <input type="text" id="ar1" name="arret_1" class="form-control" placeholder="Arret_1">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="ar2" class="col-sm-2 col-form-label">Arret n_2: </label>
                                <div class="col-sm-6">
                                    <input type="text" id="ar2" name="arret_2" class="form-control" placeholder="Arret_2">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="ar3" class="col-sm-2 col-form-label">Arret n_3: </label>
                                <div class="col-sm-6">
                                    <input type="text" id="ar3" name="arret_3" class="form-control" placeholder="Arret_3">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="end" class="col-sm-2 col-form-label">Ville d'arriver:</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" id="end" name="v_arriver" placeholder="Ville d'arriver">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="d_depart" class="col-sm-2 col-form-label">Date de depart:</label>
                                <div class="col-sm-6">
                                    <input type="date" class="form-control" id="d_depart" name="date_depart">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="h_depart" class="col-sm-2 col-form-label">Heure de depart:</label>
                                <div class="col-sm-6">
                                    <input type="time" class="form-control" id="h_depart" name="h_depart">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label  class="col-sm-2 col-form-label">Option de trajet :</label>
                                <div class="col-sm-3">
                                    <div class="custom-control custom-checkbox my-1 mr-sm-2">
                                        <input type="checkbox" class="custom-control-input" id="fummer" name="opt_fummer" value="autoriser fummer">
                                        <label class="custom-control-label" for="fummer"> Autoriser fummer </label>
                                    </div>
                                    <div class="custom-control custom-checkbox my-1 mr-sm-2">
                                        <input type="checkbox" class="custom-control-input" id="bagage" name="opt_bagage" value="autoriser bagage">
                                        <label class="custom-control-label" for="bagage"> Autoriser bagage </label>
                                    </div>
                                    <div class="custom-control custom-checkbox my-1 mr-sm-2">
                                        <input type="checkbox" class="custom-control-input" id="music" name="opt_musique" value="autoriser musique">
                                        <label class="custom-control-label" for="music"> Autoriser musique </label>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="n_place" class="col-sm-2 col-form-label">Nombre de place:</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" id="n_place" name="n_place" placeholder="Place disponible">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="p_place" class="col-sm-2 col-form-label">Prix de la place:</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" id="p_place" name="p_place" placeholder="Prix d'une place et calculer (distance*0.5 DA)" readonly>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="mat" class="col-sm-2 col-form-label">Id_voiture:</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" id="mat" name="id_matricule" placeholder="Le matricule de la voiture">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="marque" class="col-sm-2 col-form-label">Marque:</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" id="marque" name="v_marque" placeholder="Le type de la voiture">
                                </div>
                            </div>
                            <br>
                            <div class="form-group row">
                                <label for="desc" class="col-sm-2 col-form-label">Description :</label>
                                <div class="col-sm-6">
                                    <textarea class="form-control" id="desc" name="v_description" rows="3" placeholder="Description de l'etat de la voiture"></textarea>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label  class="col-sm-2 col-form-label"></label>
                                <div class="col-sm-2">
                                    <div class="custom-control custom-checkbox my-1 mr-sm-2">
                                        <input type="checkbox" class="custom-control-input" id="verefie" onclick="">
                                        <label class="custom-control-label" for="verefie" onclick="publierVerefie()">Verefie moi! </label>
                                    </div>
                                </div>
                            </div>
                            <br>
                            <div class="form-group row">
                                <div class="col-9">
                                    <button type="submit" id="valider" class="btn btn-warning" disabled>Publier</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>


    </div>

    <div class="tab-pane fade" id="nav-demande" role="tabpanel" aria-labelledby="nav-demande-tab">

        <section id="demande_reservation">
            <div class="container mytxt">
                <h5>Les Demandes de reservation</h5>
                <p>Consultez les demandes de reservations des trajet deja publier, validez ou refusez une demande. </p>
            </div>
            <br>
            <div class="contaner">
                <c:forEach items="${membres}" var="membre" varStatus="status">
                    <div class="card testimonial-card" style="max-width: 100%">
                        <div class="card-header" style="background-color:#1dd1a1">
                        </div>
                        <div class="card-body">
                            <c:forEach items="${reservations}" var="reservation" begin="${status.count-1}" end="${status.count-1}">
                                <h4>Identifiant de la rservation : ${reservation.id_reservation} </h4>
                                <h4 class="card-title d-flex justify-content-end" >
                                    <div class="row">
                                        <a href="<c:url value="ValiderReservation">
                                                    <c:param name="id_reservation" value="${reservation.id_reservation}"/>
                                                    <c:param name="id_membre" value="${id_membre}"/>
                                                 </c:url>" style="padding-left:8%" onclick="return(confirm('Voullez vous accepter cette demmande de reservation ? '))">
                                            <img src="static/img/icons8_Ok_23px.png">
                                        </a>
                                        <a href="<c:url value="SupprimerReservation">
                                                    <c:param name="id_reservation" value="${reservation.id_reservation}"/>
                                                    <c:param name="id_membre" value="${id_membre}"/>
                                                 </c:url>" style="padding-left:5%" onclick="return(confirm('Voullez vous refuser cette demmande de reservation ?'))">
                                            <img src="static/img/icons8_Cancel_23px_1.png" >
                                        </a>
                                    </div>
                                </h4>
                            </c:forEach>
                            <hr>
                            <div class="row">
                                <div class="col-sm-12 col-md-4 col-lg-2">
                                    <img src="${membre.image}" width="90%">
                                    <br>
                                </div>
                                <br>
                                <div class="col-sm-12 col-md-4 col-lg-5">
                                    <p><strong>Identifiant membre :</strong> ${membre.nom_utilisateur} </p>
                                    <p><strong>Nom :</strong> ${membre.nom} </p>
                                    <p><strong>Prenom :</strong> ${membre.prenom} </p>
                                    <p><strong>Date de naissance :</strong> ${membre.date_naissance} </p>
                                    <br>
                                </div>
                                <br>
                                <div class="col-sm-12 col-md-4 col-lg-5">
                                    <p><strong> Note :</strong> ${membre.note} </p>
                                    <c:forEach items="${trajets}" var="trajet" begin="${status.count-1}" end="${status.count-1}">
                                        <p><strong>Idantifiant trajet :</strong> ${trajet.id_trajet} </p>
                                    </c:forEach>
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
    document.getElementById("d_depart").setAttribute("min", today);

</script>



<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js" ></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js" ></script>


<!--speciale pour importer le google map api -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyArft1j_q20ao97RVTqcXeKdQoIzXUwFlA&libraries=places&callback=initMap"
        async defer></script>
<script src="static/js/my_script_map_1.js"></script>

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