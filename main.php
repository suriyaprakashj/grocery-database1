<?php
include_once("config.php");
include_once("Database.php");
$db = new Database();
// $db->query("select * from customer where EmployeeFirstname=:firstName");
$db->query("select * from customer where Lastname=:lastname");
$db->bind(':lastname', "chowdary"); 
$results = $db->resultSet();
echo "Here are the people with last name chowdary: \n";
foreach ($results as $result) {
    echo $result->Customerid . "\t" . $result->Firstname . "\t" .
       $result->Lastname . "\t" . $result->Address.  "\t" . $result->city. "\t" . $result->state. "\t" . $result->zipcode.   "\t" . $result->email. "\t" . $result->phonenumber  ;
}
$db->query("insert into customer values ('AA123','kiran','raj','670Avenue','romeoville','chicago','98005','kiranraj123@gmail.com',206608709)");

$db->execute();
?>