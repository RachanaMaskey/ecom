<?php 
require('top.php');

if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

if (isset($_SESSION['total_price']) && isset($_SESSION['unique_order_id'])) {
    $total_price = $_SESSION['total_price'];
    $unique_order_id = $_SESSION['unique_order_id'];

    // Format the total price
    $total_price = number_format($total_price, 2, '.', '');

    echo "Total Price: $total_price<br>";
    echo "Unique Order ID: $unique_order_id<br>";

    // Prepare the message according to the specified order of signed field names
    $message = "total_amount={$total_price},transaction_uuid={$unique_order_id},product_code=EPAYTEST";
    echo $message;

    // Secret key for HMAC-SHA256
    $secret_key = '8gBm/:&EnhH.1/q';

    // Generate the HMAC-SHA256 hash and then encode it in Base64
    $hash = hash_hmac('sha256', $message, $secret_key, true);
    $signature = base64_encode($hash);

    echo "Signature: " . $signature;
} else {
    echo "No order details received.";
}
?>

<!-- Payment Form -->
<section class="my-5 py-5">
    <div class="ht__bradcaump__area" style="background: rgba(0, 0, 0, 0) url(images/bg/4.webp) no-repeat scroll center center / cover ;">
        <div class="ht__bradcaump__wrap">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="bradcaump__inner">
                            <nav class="bradcaump-inner">
                                <a class="breadcrumb-item" href="index.php">Home</a>
                                <span class="brd-separetor"><i class="zmdi zmdi-chevron-right"></i></span>
                                <span class="breadcrumb-item active">Payment</span>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <section>
        <br><br><br>
        <div class="mx-auto container text-center">
            <?php if ($total_price > 0) { ?>
                <p>Total payment: Rs. <?php echo $total_price; ?></p>

                <form action="https://rc-epay.esewa.com.np/api/epay/main/v2/form" method="POST">
                    <input type="hidden" id="amount" name="amount" value="<?php echo $total_price; ?>" required>
                    <input type="hidden" id="tax_amount" name="tax_amount" value="0" required>
                    <input type="hidden" id="total_amount" name="total_amount" value="<?php echo $total_price; ?>" required>
                    <input type="hidden" id="transaction_uuid" name="transaction_uuid" value="<?php echo $unique_order_id; ?>" required>
                    <input type="hidden" id="product_code" name="product_code" value="EPAYTEST" required>
                    <input type="hidden" id="product_service_charge" name="product_service_charge" value="0" required>
                    <input type="hidden" id="product_delivery_charge" name="product_delivery_charge" value="0" required>
                    <input type="hidden" id="success_url" name="success_url" value="http://localhost/php/ecom/esewa_success.php" required>
                    <input type="hidden" id="failure_url" name="failure_url" value="http://localhost/php/ecom/esewa_failure.php" required>
                    <input type="hidden" id="signed_field_names" name="signed_field_names" value="total_amount,transaction_uuid,product_code" required>
                    <input type="hidden" id="signature" name="signature" value="<?php echo $signature; ?>" required>
                    <input src="images/eSewa.webp" type="image" height="150px" width="300px">
                </form>
            <?php } else { ?>
                <p>You don't have any order for payment</p>
            <?php } ?>
        </div>
    </section>
</section>

<?php require('footer.php') ?>
