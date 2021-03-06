<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Счета</title>

<!-- Latest compiled and minified CSS & JS -->
<link rel="stylesheet" media="screen" href="//netdna.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>


</head>
<body background="https://www.solidbackgrounds.com/images/3840x2160/3840x2160-cream-solid-color-background.jpg">
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
     $receipts = getAllReceipts($db);
     ?>
     <table class="table table-bordered">
     <tr>
     <th>Счет</th>
     <th>Статус оплаты</th>
     </tr>
     <?php foreach ($receipts as $receipt) { ?>
     <tr>
    <td><?php echo $receipt['receipt_id']; ?></td>
    <td><?php echo $receipt['payment_state_id']; ?></td>
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