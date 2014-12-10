<?php
try {
    $pdo = new PDO('mysql:host=localhost;dbname=textadventure', 'test', 'testtest');
} catch (PDOException $e) {
    echo "ERROR!: $e";
}
