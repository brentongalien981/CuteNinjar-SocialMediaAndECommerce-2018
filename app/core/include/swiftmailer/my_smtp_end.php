<?php

require_once 'config.php';


try {
    $message = (new Swift_Message())

            // Give the message a subject
            ->setSubject('My PHP Swiftmailer Email Test')

            // Set the From address with an associative array
            ->setFrom($from)

            // Set the To addresses with an associative array (setTo/setCc/setBcc)
            ->setTo($to)

            // Give it a body
            ->setBody('Thank you for joining FatNinjar. Just click the link below to complete your sign-up.');

    // create the transport
    $transport = (new Swift_SmtpTransport($smtp_server, 587, 'tls'))
            ->setUsername($username)
            ->setPassword($password);

    // Create the Mailer using your created Transport
    $mailer = new Swift_Mailer($transport);


    $result = $mailer->send($message);
    if ($result) {
        echo "Number of emails sent: $result";
    } else {
        echo "Couldn't send email";
    }
} catch (Exception $e) {
    echo $e->getMessage();
}