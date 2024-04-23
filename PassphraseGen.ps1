#PassphraseGen is a simple, semi-random passphrase generator to make easy to remember passphrases that meet most security criteria.

#This is the main function that reads the word list then adds some random characters and numbers to random words to make a mostly secure password or passphrase.
function Get-RandomPassphrase {
    #This grabs 3 random words from your word list
    $WordList = Get-Content -Path 'WordList.txt' | Sort-Object {Get-Random} | Select-Object -First 3
    $Delimiter = Get-Random -InputObject '!','@','#','$','%','^','&','*','(',')','?',':','/','.',';','+','='
    $Number1 = Get-Random -Minimum 10 -Maximum 999
    $Number2 = Get-Random -Minimum 10 -Maximum 99
    #Here we take the first two random words, then capitalize them and mash them together, to make a base password
    $Passphrase = ($WordList[0].substring(0,1).ToUpper()+$WordList[0].substring(1).ToLower()) + ($WordList[1].substring(0,1).ToUpper()+$WordList[1].substring(1).ToLower())
    #Now, if the base password is less than 12 characters long, we add a third random word and capitalize it before adding a special character and a 2 or 3 digit random number
    if ($Passphrase.length -lt 12){
    	$Passphrase += ($WordList[2].substring(0,1).ToUpper()+$WordList[2].substring(1).ToLower()) + $Delimiter + $Number1
    } else {
     #But, if it is at least 12 characters long, we just add a special character and a 2 digit random number
     $Passphrase += $Delimiter + $Number2
    }
    
    return $Passphrase
}

#This prompts for the number of passphrases to create
$Total = Read-Host -Prompt 'How many passphrases would you like to generate?'

#This iterates the function to create the number of passphrases requested by the user
for ($i = 0; $i -lt $Total; $i++){
Get-RandomPassphrase
}
