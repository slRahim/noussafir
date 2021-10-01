<!doctype html>
<html lang="frr">

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
    <link href="static/css/mycss1.css" rel="stylesheet">

    <title>Admin</title>
</head>
<body>

<nav class="navbar sticky-top navbar-expand-lg navbar-dark bg-dark " >
    <a class="navbar-brand" href="profile_admin.jsp">
        <img src="static/img/logo.png" style="width: 60px;">
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar4" aria-controls="navbar4" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div id="navbar4" class="collapse navbar-collapse mypading" >
        <ul class="navbar-nav mr-auto ">

        </ul>
        <a data-toggle="popover" data-placement="bottom" title="Notification" data-content="<c:forEach items="${liste_notification}" var="notify">${notify}</c:forEach>">
            <img src="static/img/icons8_Notification_35px.png">
            <span class="badge badge-light">${nombre_notification}</span>
        </a>
        <a href="<c:url value="/Acceuil"></c:url>" class="btn btn-md  btn-danger" style="margin-left: 2%">Se deconnecter</a>
    </div>
</nav>



<nav >
    <div class="nav nav-tabs" id="nav-tab" role="tablist">
        <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">Acceuil</a>
        <a class="nav-item nav-link" id="nav-membre-tab" data-toggle="tab" href="#nav-membre" role="tab" aria-controls="nav-membre" aria-selected="false">Gestion des membres</a>
        <a class="nav-item nav-link" id="nav-trajet-tab" data-toggle="tab" href="#nav-trajet" role="tab" aria-controls="nav-trajet" aria-selected="false">Gestion des trajets</a>
    </div>
</nav>


<div class="tab-content" id="nav-tabContent">

    <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
        <section id="statistique">
            <div class="container mytxt">
                <h5>Statistique </h5>
                <p>Les statistiques de site les plus important et pour plus de detail cliquez sur plus de statistique</p>
            </div>
            <br>
            <div class="container">
                <div class="row">
                    <div class="col-sm-12 col-lg-6 mypadinginscrit">
                        <div class="container mytxt">
                            <img src="static/img/nbutilisateur.png" width="150px">
                            <br> <br>
                            <h5>Le nombre de reservation </h5>
                            <c:forEach items="${stat}" var="stat" begin="0" end="0">
                                <p> il y a plus de ${stat} Ko reservations dans des trajets dans chaque semaine.</p>
                            </c:forEach>
                        </div>
                    </div>
                    <div class="col-sm-12 col-lg-6 mypadinginscrit">
                        <div class="container mytxt">
                            <img src="static/img/message.png" width="150px">
                            <br> <br>
                            <h5>Les messages reçu</h5>
                            <c:forEach items="${stat}" var="stat" begin="3" end="3">
                                <p> il y a plus de ${stat} message reçu dans votre boite de messagrie.</p>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-sm-12 col-lg-6 mypadinginscrit">
                        <div class="container mytxt">
                            <img src="static/img/destination.png" width="150px">
                            <br> <br>
                            <h5>Les trajets </h5>
                            <c:forEach items="${stat}" var="stat" begin="2" end="2">
                                <p> On a conté plus de ${stat} Ko trajets diferent publier dans le site.</p>
                            </c:forEach>
                        </div>
                    </div>
                    <div class="col-sm-12 col-lg-6 mypadinginscrit">
                        <div class="container mytxt">
                            <img src="static/img/compte.png" width="150px">
                            <br> <br>
                            <h5> Nombre d'utilisateur </h5>
                            <c:forEach items="${stat}" var="stat" begin="1" end="1">
                                <p> Le nombre de utilisateur du site a depassé la bare de ${stat} Ko utilisateur . </p>
                            </c:forEach>
                        </div>
                    </div>
                </div>
                <br><br>
                <a href="/Statistique" class="d-flex justify-content-center">Consulter tout les statistiques</a>
            </div>
        </section>

        <section id="message">
            <div class="container mytxt">
                <h5>Messages reçu</h5>
                <p>La liste des messages avec la possibilliter de repondre sur le message,ou la suppression.</p>
            </div>
            <br>
            <div class="contaner">
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                        <tr class="bg-warning">
                            <th scope="col">#</th>
                            <th scope="col"></th>
                            <th scope="col">Id_message</th>
                            <th scope="col">Emmeteur</th>
                            <th scope="col">Titre</th>
                            <th scope="col">Date d'ajout</th>

                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${liste_message}" var="message" varStatus="status">
                            <tr>
                                <th scope="row">${status.count}</th>
                                <td>
                                    <a href="<c:url value="/Repondre"><c:param name="id_message" value="${message.id_message}"/></c:url> " target="_blank" style="padding-left:5%">
                                        <img src="static/img/icons8_Pen_23px.png">
                                    </a>
                                    <a href="<c:url value="/SupprimerMessage"><c:param name="id_message" value="${message.id_message}"/></c:url>" style="padding-left:5%">
                                        <img src="static/img/icons8_Trash_25px.png" >
                                    </a>
                                </td>
                                <td>${message.id_message}</td>
                                <td>${message.emmeteur}</td>
                                <td>Reclamation</td>
                                <td>${message.date_message}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </section>
    </div>

    <div class="tab-pane fade" id="nav-membre" role="tabpanel" aria-labelledby="nav-profile-tab">
        <section id="recherche_membre" class="parallax">
            <div class="container">
                <div class="row" style="padding-top:20% ">
                    <div class="col-sm-12 col-md-12 col-lg-12">
                        <input type="text" id="chercher_membre" class="form-control" placeholder="Rechercher .....">
                    </div>
                </div>
            </div>
        </section>
        <section id="membre">
            <div class="container mytxt">
                <h5>Les membres du site</h5>
                <p>Consultez la liste des membres du site.en plus,de la suppression des membres et le blocage des comptes. </p>
            </div>
            <br>
            <div class="contaner">
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                        <tr class="bg-warning">
                            <th scope="col">#</th>
                            <th scope="col"></th>
                            <th scope="col">Id_membre</th>
                            <th scope="col">Nom</th>
                            <th scope="col">Prenom</th>
                            <th scope="col">Date naissance</th>
                            <th scope="col">Note</th>
                            <th scope="col">Etat</th>
                        </tr>
                        </thead>
                        <tbody id="table_membre">
                        <c:forEach items="${liste_membre}" var="membre" varStatus="status">
                            <tr>
                                <th scope="row">${status.count}</th>
                                <th scope="row">
                                    <a href="<c:url value="/BloquerMembre"><c:param name="id_membre" value="${membre.nom_utilisateur}"/></c:url>" style="padding-left:5%" onclick="return(confirm('Voullez vous bloquer ce membre ?'))">
                                        <img src="static/img/icons8_Access_Denied_25px.png">
                                    </a>
                                    <a href="<c:url value="/SupprimerMembre"><c:param name="id_membre" value="${membre.nom_utilisateur}"/></c:url>" style="padding-left:5%" onclick="return(confirm('Voullez vous supprimer ce membre ?'))">
                                        <img src="static/img/icons8_Deniede_25px.png">
                                    </a>
                                    <a href="<c:url value="/Debloquer"><c:param name="id_membre" value="${membre.nom_utilisateur}"/></c:url>" style="padding-left:5%" onclick="return(confirm('Voullez vous débloquer ce membre ?'))">
                                                <img src="static/img/debloquer.png">
                                    </a>
                                </th>
                                <td>${membre.nom_utilisateur}</td>
                                <td>${membre.nom}</td>
                                <td>${membre.prenom}</td>
                                <td>${membre.date_naissance}</td>
                                <td>${membre.note}</td>
                                <c:forEach items="${complement_compte}" var="compte" begin="${status.count-1}" end="${status.count-1}">
                                    <td>${compte.etat}</td>
                                </c:forEach>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </section>
    </div>

    <div class="tab-pane fade" id="nav-trajet" role="tabpanel" aria-labelledby="nav-contact-tab">
        <section id="recherche_trajet" class="parallax">
            <div class="container">
                <div class="row" style="padding-top: 20% ">
                    <div class="col-sm-12 col-md-12 col-lg-12">
                        <input type="text" id="chercher_trajet" class="form-control" placeholder="Rechercher ....">
                    </div>
                </div>
            </div>
        </section>
        <section id="trajet">
            <div class="container mytxt">
                <h5>Les trajets</h5>
                <p>Suivez les trajets publier dans le site et qui sont en cours. faites la gestion des trajets supprimer trajet ou les reservations du trajet.</p>
            </div>
            <br>
            <div class="contaner">
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                        <tr class="bg-warning">
                            <th scope="col">#</th>
                            <th scope="col"></th>
                            <th scope="col">Id trajet</th>
                            <th scope="col">Conducteur</th>
                            <th scope="col">Date d'ajout</th>
                            <th scope="col">Ville de depart</th>
                            <th scope="col">Ville d'arriver</th>
                        </tr>
                        </thead>
                        <tbody id="table_trajet">
                        <c:forEach items="${liste_trajet}" var="trajet" varStatus="status">
                            <tr>
                                <th scope="row">${status.count}</th>
                                <th scope="row" >
                                    <a href="<c:url value="/Reservation"><c:param name="id_trajet" value="${trajet.id_trajet}"/></c:url>" style="padding-left:5%">
                                        <img src="static/img/icons8_Edit_File_25px.png">
                                    </a>
                                    <a href="<c:url value="/SupprimerTrajetAdmin"><c:param name="id_trajet" value="${trajet.id_trajet}"/></c:url>" style="padding-left:5%" onclick="return(confirm('Voullez vous supprimer ce trajet'))">
                                        <img src="static/img/icons8_Trash_25px.png" >
                                    </a>
                                </th>
                                <td>${trajet.id_trajet}</td>
                                <c:forEach items="${complement_trajet}" var="membre" begin="${status.count-1}" end="${status.count-1}">
                                    <td>${membre.nom_utilisateur}</td>
                                </c:forEach>
                                <td>${trajet.date_ajout}</td>
                                <td>${trajet.v_depart}</td>
                                <td>${trajet.v_arriver}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </section>
    </div>

</div>


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
<script> new WOW().init(); </script>
<script>
    $(function () {
        $('[data-toggle="popover"]').popover()
    })

</script>

<!-- la fonction de filtrage -->
<script >

    $(document).ready(function(){
        $("#chercher_membre").on("keyup", function() {
            var value = $(this).val().toLowerCase();
            $("#table_membre tr").filter(function() {
                $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
            });
        });
    });

    $(document).ready(function(){
        $("#chercher_trajet").on("keyup", function() {
            var value = $(this).val().toLowerCase();
            $("#table_trajet tr").filter(function() {
                $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
            });
        });
    });

</script>
</body>
</html>