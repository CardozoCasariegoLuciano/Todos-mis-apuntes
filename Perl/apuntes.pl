use warnings;
use strict;
use utf8;

use 5.010; # para usar el "say" de la linea 32
use feature "switch";
no warnings "experimental::smartmatch";


# esto es un comentario

# las variables de indican con "my"

# variables escalares: solo guardan una cosa (no listas, ni mapas, ni etc)
#  se indican con "$"

my $numero = 3;
my $flotante = 1.53245;
my $string = "Holaaa";


my $octal = 0377; #3*8+7 *8+7
my $hexa = 0xff; #3*8+7 *8+7

#print($octal);


# siclo while

my $count = 0;

while($count < 5){
    $count++;
    say $count;
}


# Booleanos e if


my $boolean1 = 0; # el 0 da falso

# mas valores que dan falso
# 
# '0' cero entre comillas 
#  undef
#  ""
#  () lista vacia
#   ("") lista con comillas vacias

my $tarea = undef;

if($tarea){
    print("Bien ahi \n")
}else{
    print("Mal ahi \n")
}



# Arreglo  -- foreach -- for
# se indican con un @

my @Paices = ("aleman", "Ruso", "Argentino", "Pepardo");

foreach my $pais (@Paices){
    say $pais;
}


for(my $i = 0 ; $i < 3; $i++){
    say $Paices[$i];
}

# para trael el idice superior:
say $#Paices; # retorna 3 ya que en la variable tengo 4 elementos (con index = 0,1,2 y 3)

push @Paices, "Brasil"; # agrega el elemento al final de la lista
unshift @Paices, "Brasil"; # agrega el elemento al principio de la lista

say scalar @Paices;  # nos retorna la cantidad de elementos 

my $elUltimo = pop @Paices;  #El ultimo de la lista
my $ePrimero = shift @Paices; #El primero de la lista

say $elUltimo;
say $ePrimero;

say ("---------------------------");

## Ejemplo de listas

my @numeros = (1,2,0,14,5,6,7);

my $mayor = $numeros[0];

for(my $i = 0 ; $i < $#numeros + 1 ; $i++){

    if($numeros[$i] > $mayor){
        $mayor = $numeros[$i];
    }
}

say ("El mayor es " . $mayor);



my $menor = $numeros[0];

for(my $i = 0 ; $i < $#numeros + 1 ; $i++){

    if($numeros[$i] < $menor){
        $menor = $numeros[$i];
    }
}

say ("El menor es " . $menor);


### switch

my $edad = 15;

given($edad){

    when ($_ eq 18 ){  #$_ representa la variable $edad
        say "Tenes 18 años";
        continue;  # si uso el continue va a seguir intentando machear con algun otro, yo diria de no usarlo
    }   

    when ($_ eq 15 ){ 
        say "Tenes 15 años";
        continue;
    }               
}


## comparadores 

#  "Hola" eq "Chau" --> false




#-------------------------------------------------------#
say ("-----------------HASH--------------------------");
#Hash
# se declaran con el "%"

my %hash = (
    1 => "Pepe",
    2 => "Lucas"
);

say($hash{1});




say ("-----------------Strings--------------------------");

my $unNombre = "Luciano Cardozo Casariego";

say("La longitud del nombre es: " . length $unNombre);
say("La letra Z se encuentra en el indice: " . index $unNombre, "a"); # retorna la primera que encuenta
say("La ultima A se encuentra en el indice: " . rindex $unNombre, "a");# retorna la ultima que encuenta

my $unApellido = substr $unNombre , 7, (length $unNombre)-16;
say("La variable apellido contiene:" . $unApellido);


my $nombreEnMinuscula = "pepe";
say ("esta en minuscula: " . $nombreEnMinuscula . " Ahora en mayusucla " . ucfirst $nombreEnMinuscula);

say ("esta en Mayuscula: " . $unNombre . " Ahora en minuscula " . lcfirst $unNombre);

say ("No todas son mayusuclas: " . $unNombre . " Todas son mayusculas " . uc $unNombre);

say ("No todas son minusculas: " . $unNombre . " Todas son minusculas " . lc $unNombre);




say ("-----------------Funcioneees--------------------------");

#se indican con sub

sub suma{
    my($a, $b) = @_;  # asi de feo se crean los parametros
    say ("el resultado de " . $a . " + " . $b . " es: " . ($a + $b));
}

suma(1,4);
suma(17,41);

sub sumaDeNumeros{
    my($a, $b) = @_;  # asi de feo se crean los parametros
    return ($a + $b);
}

say sumaDeNumeros(12 , 8);



say ("-----------------Archivos--------------------------");

# < significa que voy a leer el archivo
# > significa que voy a escribir el archivo (sobreescribiendo todo lo que tiene)
# >> significa que voy a escribir el archivo (no sobreescribe, solo agrega)

open(my $file, "<holamundo.pl");

while(my $fila = <$file>){
say $fila;
}

close $file;



open(my $file2, ">preubaDeArchivosEnPerl.txt");

print $file2 "Esto lo agregue yo 
";

close $file2;

say ("-----------------Constantesssay--------------------------");

use constant edad => 26;

say edad;












