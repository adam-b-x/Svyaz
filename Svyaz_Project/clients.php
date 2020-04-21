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
     $clients = getAllClients($db);
     ?>
     <table class="table table-bordered">
     <tr>
     <th>Клиент</th>
     <th>Операторы</th>
     <th>Удалить</th>
     </tr>
     <?php foreach ($clients as $client) { ?>
     <tr>
    <td><a href="edit.php? client_id=<?php echo $client['client_id'];?>">
    <?php echo $client['client_name']; ?></a></td>
    <td><?php echo $client['oper_name']; ?></td>
    <td><a class="btn btn-danger" href="delete.php? client_id=<?php echo $client['client_id'];?>">Удалить</a></td>
     </tr>
     <?php } ?>

         
     
     </table>
     <button id="addButton" class="btn btn-default">Добавить клиента</button>
     <form action="" method="POST" role="form" style="display: none;
     margin-top:20px;">
     <div class="form-group">
            <label for="name">Введите имя</label>
            <input type="text" class="form-control" id="name"  name="name" 
            placeholder="Введите имя">
        </div>
        
        <div class="form-group">
            <select name="oper" class="form-control" id="oper">
                <?php 
                 $opers= getAllOpers($db);
                 foreach ($opers as $key => $value) {
                   echo "<option value=".$value['oper_id'].">".$value['oper_name']."</option>";
                }
                ?>
            </select>
        </div>


        <button type="submit" class="btn btn-default">Добавить</button>
    </form>
 </div>
    
   <?php 
   if(isset($_POST['name']) && $_POST['name'] !='' ) {
       $clientname = $_POST['name'];
       $operid = $_POST['oper']; 
       addClient($db, $clientname, $operid);
       var_dump($_POST);
   }
   ?>
    
</div>
<footer>

</footer>
<script>
    $("#addButton").click(function(){
    $("form").slideDown();
    });
</script>
</body>
</html>