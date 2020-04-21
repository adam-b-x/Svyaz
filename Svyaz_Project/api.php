<?php

function getAllClients($db) {

    
        
$sql= "SELECT * FROM alisher_clients
       INNER JOIN alisher_oper on alisher_clients.oper_id = alisher_oper.oper_id";

        
        
        
        
$result = array();

$stmt = $db->prepare($sql);
$stmt->execute();


while($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
    $result[$row['client_id']] = $row; 
}
return $result;

}

function getAllReceipts($db) {
    $sql = "SELECT * FROM alisher_receipt
            INNER JOIN alisher_payment_state on alisher_receipt.payment_state_id = alisher_payment_state.payment_state_id";
    
    $result = array();
    
    $stmt = $db->prepare($sql);
    $stmt->execute();
  
    
    while($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        $result[$row['payment_state_id']] = $row; 
    }
    return $result;
    
    }

    function getAllPhone_Calls($db) {
        $sql = "SELECT * FROM alisher_receipt
                INNER JOIN alisher_phone_calls on alisher_receipt.receipt_id = alisher_phone_calls.receipt_id";
        
        $result = array();
        
        $stmt = $db->prepare($sql);
        $stmt->execute();
  
        while($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            $result[$row['receipt_id']] = $row; 
        }
        return $result;
        
        }

        function getAllPrices($db) {
            $sql = "SELECT * FROM alisher_price
                    INNER JOIN alisher_phone_calls on alisher_price.price_id = alisher_price.price_id";
            
            $result = array();
            
            $stmt = $db->prepare($sql);
            $stmt->execute();
      
            
            while($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                $result[$row['price_id']] = $row; 
            }
            return $result;
            
            }

            function getAllLocalities($db) {
                $sql = "SELECT * FROM alisher_locality
                        INNER JOIN alisher_price on alisher_locality.locality_id = alisher_price.locality_id";
                
                $result = array();
                
                $stmt = $db->prepare($sql);
                $stmt->execute();
               
                
                while($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                    $result[$row['locality_id']] = $row; 
                }
                return $result;
                
                }
              

            function GetClientById($db, $id) {
                $sql = "SELECT * FROM alisher_clients 
                        WHERE client_id = :client_id
                ";
                $stmt = $db->prepare($sql);
                $stmt->bindValue('client_id', $id, PDO::PARAM_INT);
                $stmt->execute();
                $row = $stmt->fetch(PDO::FETCH_ASSOC);
                return $row;
            }

            function saveClient($db, $name, $id) {
                $sql = "UPDATE alisher_clients
                   SET client_name = :client_name
                   WHERE client_id = :client_id
            ";
                $stmt = $db->prepare($sql);
                $stmt->bindValue(':client_name', $name, PDO::PARAM_STR);
                $stmt->bindValue(':client_id', $id, PDO::PARAM_INT);

                $stmt->execute();
            }

            function getAllOpers($db) {
                $sql = "SELECT * FROM alisher_oper";
                $res= array();
                $stmt = $db->prepare($sql);
                $stmt->execute();


                while($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                $res[$row['oper_id']] = $row; 
                     }
                return $res;
                
            
                
                    }

                    function addClient($db, $clientname, $operid ) {
                        $sql = "INSERT INTO alisher_clients (client_name, oper_id)
                                VALUES(:client_name, :oper_id)";                  
                       
                         
                         $stmt = $db->prepare($sql);
                         $stmt->bindValue(':client_name', $clientname, PDO::PARAM_STR);
                         $stmt->bindValue(':oper_id', $operid, PDO::PARAM_INT);
                         
         
                         $stmt->execute();
                        
                      }

                      function deleteClient($db, $id) {
                      $sql = "DELETE FROM alisher_clients WHERE client_id = :client_id";

                      $stmt = $db->prepare($sql);
                      $stmt->bindValue(":client_id", $id, PDO::PARAM_INT);

                      $stmt->execute();
                    
                      }



                      