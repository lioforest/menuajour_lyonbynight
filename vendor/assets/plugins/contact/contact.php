<?php
require_once 'config.php';

// Defind variables
$json =    array();
$email =   isset( $_POST['email'] ) ? $_POST['email'] : '';
$name =    isset( $_POST['name'] ) ? $_POST['name'] : '';
$message = isset( $_POST['message'] ) ? $_POST['message'] : '';

// Check if fields are not empty
if( !$email || !preg_match('/^[^\@]+@.*\.[a-z]{2,6}$/i', $email ) ) {
	$json['error']['email'] = 'Please enter your email address.';
}
if( !$name ) {
	$json['error']['name'] = 'Please enter your full name.';
}
if( !$message ) {
	$json['error']['message'] = 'Please enter your message.';
}

// Proceed if no erros found
if( !isset( $json['error'] ) ) {

	// Email message
	$mail_message =  "New message via GaminY: \r\n\r\n";
	$mail_message .= "Name: " . $name . "\r\n";
	$mail_message .= "Email address: " . $email . "\r\n";
	$mail_message .= "Message: " . $message;

	// Email title
	$mail_headers  = "Content-type: text/plain; charset=utf-8\r\n";
	$mail_headers .= "From: {$email}\r\n";

	// Sending email
	mail( $to_email, $mail_subject, $mail_message, $mail_headers );

	// Return success message
	$json['success'] = 'Your message has been sent successfully!';
}

// Return data
echo json_encode( $json );
?>