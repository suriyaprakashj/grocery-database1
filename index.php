<html>
    <head><title>PHP Example</title></head>
    <body>
        <?php
        include_once("config.php");
        include_once("Database.php");
        $db = new Database();
        if (!isset($_POST["firstName"]) && !isset($_POST["lastName"])) {
        ?>
        <form method="post">
            <label for="firstName">First name: </label>
            <input type="text" name="firstName"></input>
            <label for="lastName">Last name: </label>
            <input type="text" name="lastName"></input>
            <input type="submit" value="submit"></input>
        </form>
        <?php
        } else {
            $firstName = $_POST["firstName"];
            $lastName = $_POST["lastName"];
            $db->query("select * from customer where Firstname=:first and Lastname=:last");
            $db->bind(":first",$firstName);
            $db->bind(":last",$lastName);
            $results = $db->resultSet();
            echo "Here is the information you requested: <br/>";
            foreach ($results as $result) {
                   echo $result->Customerid . "\t" . $result->Firstname . "\t" .
       $result->Lastname . "\t" . $result->Address.  "\t" . $result->city. "\t" . $result->state. "\t" . $result->zipcode.   "\t" . $result->email. "\t" . $result->phonenumber  ;
                   
 "<br/>";
            }
        }
        ?>
    </body>
</html>
