function Get-RandomPassphrase {
    $WordList = Get-Content -Path 'WordList.txt' | Sort-Object {Get-Random} | Select-Object -First 3
    $Delimiter = Get-Random -InputObject '!','@','#','$','%','^','&','*','(',')','?',':','/','.',';','+','='
    $Number1 = Get-Random -InputObject 1,2,3,4,5,6,7,8,9,0
    $Number2 = Get-Random -InputObject 1,2,3,4,5,6,7,8,9,0
    $Passphrase = ($WordList[0].substring(0,1).ToUpper()+$WordList[0].substring(1).ToLower()) + ($WordList[1].substring(0,1).ToUpper()+$WordList[1].substring(1).ToLower())
    if ($Passphrase.length -lt 12){
    	$Passphrase += ($WordList[2].substring(0,1).ToUpper()+$WordList[2].substring(1).ToLower()) + $Delimiter + $Number1
    } else {
      $Passphrase += $Delimiter + $Number1 + $Number2
    }
    
    return $Passphrase
}

Get-RandomPassphrase
