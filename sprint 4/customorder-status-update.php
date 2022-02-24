<?php
// Include config file
require_once "config.php";




// Processing form data when form is submitted
if(isset($_GET["Order_id"]) && !empty($_GET["Order_id"])){
    // Get hidden input value
    $Order_id = $_GET["Order_id"];
		$status = trim($_GET["status"]);
		

    // Prepare an update statement
    $dsn = "mysql:host=$db_server;dbname=$db_name;charset=utf8mb4";
    $options = [
        PDO::ATTR_EMULATE_PREPARES   => false, // turn off emulation mode for "real" prepared statements
        PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION, //turn on errors in the form of exceptions
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC, //make the default fetch be an associative array
    ];
    try {
        $pdo = new PDO($dsn, $db_user, $db_password, $options);
    } catch (Exception $e) {
        error_log($e->getMessage());
        exit('Something weird happened');
    }

    $vars = parse_columns('order_tbl', $_POST);
    $stmt = $pdo->prepare("UPDATE customorder SET Status=? WHERE Order_id=?");

    if(!$stmt->execute([ $status,$Order_id  ])) {
        echo "Something went wrong. Please try again later.";
        header("location: error.php");
    } else {
        $stmt = null;
        //header("location: order_tbl-read.php?Order_id=$Order_id");
		//praveen
		header("location: customorder-index-admin.php");
    }
} 
       

        // Close statement
        mysqli_stmt_close($stmt);

   
?>
