$path = "C:\Users\Developer\AppData\Local\Red Gate\SQL Prompt 9\Snippets"
$outFile = "C:\Temp\end.code-snippets"
$dict = @{} 

Get-ChildItem $path -Filter *.sqlpromptsnippet | 
Foreach-Object {

    $content = [XML](Get-Content $_.FullName )

    $body = [System.Collections.ArrayList]@()
    $null = $body.Add($content.SelectSingleNode("//Snippet/Code").InnerText)

    $definition = [ordered]@{
        'prefix'    = $content.SelectSingleNode("//Header/Shortcut").InnerText
        'body'    = $body
        'description' = ''
      }
    $dict[$content.SelectSingleNode("//Header/Title").InnerText] = $definition
}
If (Test-Path $outFile){
    Remove-Item $outFile
}
$dict |  ConvertTo-Json | Out-File -filepath $outFile -Encoding "UTF8" 