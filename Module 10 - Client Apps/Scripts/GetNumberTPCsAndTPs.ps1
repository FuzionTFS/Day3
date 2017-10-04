Add-Type -Path "C:\Program Files (x86)\Microsoft Visual Studio 14.0\Common7\IDE\CommonExtensions\Microsoft\TeamFoundation\Team Explorer\Microsoft.TeamFoundation.Client.dll"
$uri = "http://vsalm:8080/tfs"
$tfsConfigurationServer = [Microsoft.TeamFoundation.Client.TfsConfigurationServerFactory]::GetConfigurationServer($uri)
$tpcService = $tfsConfigurationServer.GetService("Microsoft.TeamFoundation.Framework.Client.ITeamProjectCollectionService")

$sortedCollections = $tpcService.GetCollections() | Sort-Object -Property Name
$numberOfProjects = 0

foreach($collection in $sortedCollections) {
    $collectionUri = $uri + "/" + $collection.Name
    $tfsTeamProject = [Microsoft.TeamFoundation.Client.TfsTeamProjectCollectionFactory]::GetTeamProjectCollection($collectionUri)
    $cssService = $tfsTeamProject.GetService("Microsoft.TeamFoundation.Server.ICommonStructureService3")   
    $sortedProjects = $cssService.ListProjects() | Sort-Object -Property Name

    Write-Host $collection.Name "- contains" $sortedProjects.Count "project(s)"

    foreach($project in $sortedProjects)
    {
        $numberOfProjects++
        Write-Host (" - " + $project.Name)
    }
}

Write-Host
Write-Host "Total number of project collections" $sortedCollections.Count
Write-Host "Total number of projects           " $numberOfProjects