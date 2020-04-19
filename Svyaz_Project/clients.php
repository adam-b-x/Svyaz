<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Клиенты</title>

<!-- Latest compiled and minified CSS & JS -->
<link rel="stylesheet" media="screen" href="//netdna.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>


</head>
<body>
<header> 

<nav class="navbar navbar-default" role="navigation">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="#">AlisherSV</a>
    </div>
    <div class="collapse navbar-collapse navbar-ex1-collapse">
        <ul class="nav navbar-nav">
            <li><a href="index.php">Главная</a></li>
            <li><a href="clients.php">Клиенты</a></li>
            <li><a href="receipt.php">Счета</a></li>
   
            <li><a href="price.php">Цена</a></li>
            <li><a href="locality.php">Насленные пункты</a></li>
            <li><a href="phone_calls.php">Разговоры</a></li>
        </ul>
            </li>
        </ul>
    </div>
</nav>
</header>

<div id="content"> 
<div class="container-fluid">
     <?php include 'db.php'; ?>
     <?php include 'api.php'; ?>
     <?php 
     $clients = getAllClients($db);
     ?>
     <table class="table table-bordered">
     <tr>
     <th>Клиент</th>
     <th>Счет</th>
     </tr>
     <?php foreach ($clients as $client) { ?>
     <tr>
    <td><a href="edit.php? client_id=<?php echo $client['client_id']?>">
    <?php echo $client['client_name']; ?></a></td>
    <td><?php echo $client['receipt_id']; ?></td>
     </tr>
     <?php } ?>

         
     
     </table>
 </div>
    
</div>
</div>
<footer>

</footer>
</body>
</html>