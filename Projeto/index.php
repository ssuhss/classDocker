<style>
    .classe-div{
        width: 300px;
        border: 1px solid;
        height: 300px;
        color: #2e6da4;
        text-align: center;
    }
</style>


<div class="classe-div">
    <h1>Título em HTML</h1>
    <h3>Subtítulo</h3>
</div>

<?php
$variavelArray = ['indice1' => 1, 'indice2' => 2, 'indice25' => 25];
$variavelTexto = "<br>Texto em PHP<br>";
$variavel25 = 25;

foreach ($variavelArray as $valor){
    if($valor == $variavel25){
        echo $variavelTexto;
        continue;
    }
    echo "<br> Texto exibido varias vezes <br>";
}
