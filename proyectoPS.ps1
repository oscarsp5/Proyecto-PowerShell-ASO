Clear-Host

#Tabla Hash

$coches=@{}

#Variables para listar

$dato2 = "Año del coche:"
$dato3 = "Marca del coche"
$dato4 = "CV del coche:"
$dato5 = "Precio del coche:"
$dato6 = "Traccion del coche:"
$dato7 = "Pais del coche:"
$dato8 = "Combustible del coche:"

$tabla = @($dato2,$dato3,$dato4,$dato5,$dato6,$dato7,$dato8)

#Leer Datos del fichero

foreach ($registro in Get-Content C:\Users\Administrador.WIN-QQO7J8NOFOM\Desktop\recu\Proyecto\coches.txt.txt){
    $separador = $registro.split(":")
    $modelo = $separador[0]
    [int]$anio = $separador[1]
    $marca = $separador[2]
    [int]$cv = $separador[3]
    [long]$precio = $separador[4]
    $traccion = $separador[5]
    $pais = $separador[6]
    $combustible = $separador[7]


    $especifi = $anio,$marca,$cv,$precio,$traccion,$pais,$combustible
    $coches.Add($modelo, $especifi)

    #$coches=@{$modelo=@($anio,$marca,$cv,$precio,$traccion,$pais,$combustible)}
    #Write-Host ($coches | Out-String)
}

#------------------Funciones-----------------------------------------

#---------------------Funcion 1.altas--------------------------------------



function altas(){
    
    Write-Host "|====================|"
    Write-Host "|Agregar nuevo modelo|"
    Write-Host "|====================|"

    $modelo = Read-Host "Dime el Modelo del nuevo coche"
    [int]$anio = Read-Host "Dime el Año del nuevo coche"
    $marca = Read-Host "Dime la marca del nuevo coche"
    [int]$cv = Read-Host "Dime los caballos del nuevo coche"
    [int]$precio = Read-Host "Dime el precio del nuevo coche"
    $traccion = Read-Host "Dime la traccion del nuevo coche (Trasera,Delantera,Cuatro)"
    $pais = Read-Host "Dime el pais del nuevo coche"
    $combustible = Read-Host "Dime el combustible que usa el nuevo coche (Gasolina,Diesel)"

    #Agregamos a la tabla hash 

    $especifimas = $anio,$marca,$cv,$precio,$traccion,$pais,$combustible
     
    $coches.add($modelo,$especifimas)
    
    $volver = Read-Host "Pulsa una tecla para volver"    
    
}

#---------------------------Funcion 2.Bajas-----------------------------------


function eliminar(){
    
    Write-Host "|===============|"
    Write-Host "|Eliminar modelo|"
    Write-Host "|===============|"

    $borrar = Read-Host "Que coche quieres eliminar"
    
    $coches.remove($borrar)


    $volver = Read-Host "Pulsa una tecla para volver"
}

#--------------------------Funcion 3.Listar-------------------------------



function listar(){


    Write-Host "|===================|"
    Write-Host "|   Listado Coches  |"
    Write-Host "|===================|" `n
  



  foreach ( $listar in $coches.keys ){
            write-host "====================="
            write-host  `n `t $listar.toupper()
            write-Host 
            write-host "=====================" 

            for ($i=0;$i -lt $tabla.count;$i++){

                write-host $tabla[$i], $coches[$listar][$i] 

            }

    }
    write-Host 


$volver = Read-Host "Pulsa una tecla para volver"

}


#------------------------Funciones 4.Consultar-----------------------------

#Funcion InfoElemento

function infoelemento(){

    Write-Host "|=============================|"
    Write-Host "|    Informacion Elemento     |"
    Write-Host "|=============================|"

   
     write-host ( $coches.keys.toupper() | out-string )`n
    
        $info_coche = read-host "Elige un coche"

        Clear-host

            Write-Host `n`t`t $info_coche.toupper()

            Write-host "============================="

        for ( $i = 0; $i -lt $tabla.count;$i++) {
                
            Write-host `n $tabla[$i].toupper(), $coches[$info_coche][$i]

        }

     Write-host `n


    $volver = Read-Host "Pulsa una tecla para volver"

}


#Funcion consulpais

function consulpais(){

    Write-Host "|=============================|"
    Write-Host "|     Consultar por pais      |"
    Write-Host "|=============================|"

   #Write-Host ($coches.values[6] | Out-String)
   
    $pais = Read-Host "Escribe el pais del coche que deseas consultar"
        Write-Host "======================================================================================================"
        $aux = 0
       
foreach($lista in $coches.Keys){
        $value = $coches.$lista
        if($value -eq $pais){
        $aux = 1
        Write-Host $lista "," -NoNewline
            for($i = 0; $i -lt $value.count; $i++){
                if($i -eq $value.count - 1){
                    Write-Host $value[$i]"`n"
                }
                else{
                    Write-Host $value[$i] ","-NoNewline
                }
            }
        }

    }

    if($aux -eq 0){
        Write-Host "`nNo hay coches con ese pais`n"
    }

$volver = Read-Host "Pulsa una tecla para volver"

}

#Funcion consulprecio

function consulprecio(){

    Write-Host "|=============================|"
    Write-Host "|    Consultar por precio     |"
    Write-Host "|=============================|"
            
            $precio = Read-Host "Escribe el precio que deseas"
       Write-Host "================================================="
       $aux = 0

    foreach($lista in $coches.Keys){
        
        $value = $coches.$lista
        
        if($value -eq $precio){
        $aux = 1
        Write-Host $precio "," -NoNewline
            
            for($i = 0; $i -lt $value.count; $i++){
                
                if($i -eq $value.count - 1){
                    Write-Host $value[$i]"`n"
                }
                else{
                    Write-Host $value[$i] ", "-NoNewline
                }
            }
        }

    }
    
    if($aux -eq 0){
        Write-Host "`nNo hay coches con esta traccion`n"
    }

      
$volver = Read-Host "Pulsa una tecla para volver"
    
}

#Funcion consultraccion

function consultraccion(){

    Write-Host "|=============================|"
    Write-Host "|    Consultar por traccion   |"
    Write-Host "|=============================|"

    
    $traccion = Read-Host "Escribe la traccion que deseas consultar (Trasera,Delantera,Cuatro)"
        Write-Host "============================================================================="
        $aux = 0
    foreach($lista in $coches.Keys){
        $value = $coches.$lista
        if($value -eq $traccion){
        $aux = 1
        Write-Host $lista "," -NoNewline
            for($i = 0; $i -lt $value.count; $i++){
                if($i -eq $value.count - 1){
                    Write-Host $value[$i]"`n"
                }
                else{
                    Write-Host $value[$i] ","-NoNewline
                }
            }
        }

    }
    if($aux -eq 0){
        Write-Host "`nNo hay coches precios con este coche`n"
    }

$volver = Read-Host "Pulsa una tecla para volver"

}


#------------------------Funcion 5.Modificar-----------------------------

function modificar(){

    Write-Host "|=============================|"
    Write-Host "|          Modificar          |"
    Write-Host "|=============================|"


    write-host ( $coches.keys.toupper() | out-string )`n

    $modelo = Read-Host "Modelo del coche "

    foreach ($keys in $coches.keys) {

        if ($keys -like $modelo){
        
        Write-Host `t $keys

        #Moficacion anio
        
            $anio = Read-Host "Año del modelo:" $coches[$keys][0]
            if ($anio -ne ""){
                $coches[$keys][0] = $anio
            }
        
        #Moficacion marca
        
            $marca = Read-Host "Marca del modelo:" $coches[$keys][1]
            if ($marca -ne ""){
                $coches[$keys][1] = $marca
            }
        
        #Moficacion cv
        
            $cv = Read-Host "Cv del modelo:" $coches[$keys][2]
            if ($cv -ne ""){
                $coches[$keys][2] = $cv
            }
        
        #Moficacion precio
        
            $precio = Read-Host "Precio del modelo:" $coches[$keys][3]
            if ($precio -ne ""){
                $coches[$keys][3] = $precio
            }

        #Moficacion traccion
        
            $traccion = Read-Host "Traccion del modelo:" $coches[$keys][4]
            if ($traccion -ne ""){
                $coches[$keys][4] = $traccion
            }

        #Moficacion pais
        
            $pais = Read-Host "Pais del modelo:" $coches[$keys][5]
            if ($pais -ne ""){
                $coches[$keys][5] = $pais
            }

         #Moficacion combustible
        
            $combustible = Read-Host "Combustible del modelo:" $coches[$keys][6]
            if ($combustible -ne ""){
                $coches[$keys][6] = $combustible
            }
        
        }
    
    
    }

    


$volver = Read-Host "Pulsa una tecla para volver"

}
#------------------------Funcion 6.Salir-----------------------------

function salir (){

    Write-Host "|=============================|"
    Write-Host "|            Salir            |"
    Write-Host "|=============================|"

   Remove-item C:\Users\Administrador.WIN-QQO7J8NOFOM\Desktop\recu\Proyecto\coches.txt.txt

foreach ($guardar in $coches.keys){

     $archivo_guardar = $guardar + ":" + $coches[$guardar][0] + ":" + $coches[$guardar][1] + ":" + $coches[$guardar][2] + ":" + $coches[$guardar][3] + ":" + $coches[$guardar][4] + ":" + $coches[$guardar][5] + ":" + $coches[$guardar][6] + ":" + $coches[$guardar][7]
       
      $archivo_guardar |Out-File C:\Users\Administrador.WIN-QQO7J8NOFOM\Desktop\recu\Proyecto\coches.txt.txt -Append -encoding utf8


    }

    Write-Host "Archivo Guardado"


}

#------------------------Menus-----------------------------------------

#Menu opciones

#Clear-Host

$opciones = 0

While($opciones -ne 6 ){
    Write-Host "|===================================|"
    Write-Host "|                                   |"
    Write-Host "|              Menu                 |"
    Write-Host "|===================================|"
    Write-Host "|                                   |"              
    Write-Host "|   1. Agregar nuevo coche          |"
    Write-Host "|   2. Eliminar un coche            |"      
    Write-Host "|   3. Listar coches disponibles    |"   
    Write-Host "|   4. Consultar coches             |"
    Write-Host "|   5. Modificar                    |"
    Write-Host "|   6. Salir                        |"
    Write-Host "|                                   |"                       
    Write-Host "|===================================|"
  

    $opciones = Read-Host "Selecciona la opcion que quieras realizar "


#Switch con las opciones

    switch ($opciones){

        1{altas}
        2{eliminar}
        3{listar}


        4{

            #Clear-Host

            #Submenu opciones 4

            $opcionescuatro = 0

            while ($opcionescuatro -ne 5){
                Write-Host "|=============================|"
                Write-Host "|       1.Info Elemento       |"
                Write-Host "|      Buscar por rangos:     |"
                Write-Host "|       2.Por Pais            |"         
                Write-Host "|       3.Por Precio          |"
                Write-Host "|       4.Por Traccion        |"
                Write-Host "|   5.Volver al menu inicial  |" 
                Write-Host "|                             |"                       
                Write-Host "|=============================|"

                $opcionescuatro = Read-Host "Selecciona la opcion que quieras realizar: "
            
                #Switch con las opciones
                
                 switch ($opcionescuatro){
                
                1{infoelemento}
                2{consulpais}
                3{consulprecio}
                4{consultraccion}

            }
          }

        }

        5{modificar}
        6{salir}
        
        

    }

}




