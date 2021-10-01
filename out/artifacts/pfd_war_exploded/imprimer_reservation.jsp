<!doctype html>
<html lang="fr">
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

    <title>Imprimer reservation</title>
</head>
<body>
<br><br><br><br>
<div class="container">
    <div class="card text-dark bg-light mb-3" style="max-width: 80rem;">
        <div class="card-header">
            <h5>Bon de validation dans le covoiturage</h5>
        </div>
        <div class="card-body">
            <form>
                <div class="form-group row">
                    <label for="start" class="col-sm-2 col-form-label">Id reservation:</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="start" value="${reservation.id_reservation}" disabled>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="end" class="col-sm-2 col-form-label">Nombre de place:</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="end" value="${reservation.nombre_place}" disabled>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="ar1" class="col-sm-2 col-form-label">Montant: </label>
                    <div class="col-sm-6">
                        <input type="text" id="ar1" class="form-control" value="${reservation.montant}" disabled>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="ar2" class="col-sm-2 col-form-label">Id membre: </label>
                    <div class="col-sm-6">
                        <input type="text" id="ar2" class="form-control" value="${membre}" disabled>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="ar3" class="col-sm-2 col-form-label">Id trajet: </label>
                    <div class="col-sm-6">
                        <input type="text" id="ar3" class="form-control" value="${trajet}" disabled>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="n_place" class="col-sm-2 col-form-label">Payement:</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="n_place" value="${reservation.payement}" disabled >
                    </div>
                </div>
            </form>
        </div>
        <div class="card-footer">
            <a href="javascript:window.print()" class="btn  btn-info">Imprimer</a>
        </div>
    </div>
</div>






















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
